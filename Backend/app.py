from flask import Flask, jsonify, request
from flask_jwt_extended import JWTManager, jwt_required, get_jwt_identity
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import sessionmaker, scoped_session
from datetime import datetime

from config import Config
from models import *

app = Flask(__name__)
app.config.from_object(Config)

Base = automap_base()
engine = create_engine(Config.SQLACHEMY_DATABASE_URI)
Base.prepare(engine, reflect=True)

Account = Base.classes.account
Car = Base.classes.car
Client = Base.classes.client
Employee = Base.classes.employee
Equipment = Base.classes.equipment
Model = Base.classes.model
Orders = Base.classes.orders
Score = Base.classes.score
Test_drive = Base.classes.test_drive

session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=engine))

jwt = JWTManager(app)


# Данный метод предназначен для регистрации пользователя, передаем логин, пароль и номер телефона
@app.route('/register', methods=['POST'])
def register():
    try:
        params = request.json
        if not existAccount(session, Account, **params):
            user = registerAccount(Account, **params)
            session.add(user)
            session.commit()
            client = registerClient(Client, **params)
            session.add(client)
            session.commit()
            token = get_token(user)
            return {'access_token': token}
        else:
            return {"msg": "Account already exist"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод возвращает токен авторизации и тип аккаунта (клиент, менеджер или администратор)
@app.route('/login', methods=['GET'])
def login():
    try:
        params = request.json
        buf = authenticate(session, Account, **params)
        employee_position = "Клиент"
        res = session.query(Employee).filter(Employee.login == buf.login).all()
        if len(res) == 1:
            employee_position = res[0].employee_position
        token = get_token(buf)
    except Exception as e:
        return {"msg": str(e)}, 400
    return {"access_token": token, "employee_position": employee_position}


# Данный метод возвращает список доступных машин для аренды или покупки
@app.route('/get_full_auto_list', methods=['GET'])
@jwt_required
def get_full_auto_list():
    try:
        sql = "select M.model_mark, M.model_name, E.equipment_name, E.equipment_engine, E.equipment_price, C.vin from car C inner join equipment E on C.equipment_id = E.equipment_id left join model M on E.model_id = M.model_id;"
        res = session.execute(sql)
        data = [{"model_mark": r.model_mark, "model_name": r.model_name, "equipment_name": r.equipment_name, "equipment_engine": r.equipment_engine, "hours_price": r.equipment_price.replace("$", "").replace("?", "").replace(' ', '')[:-1],  "vin": r.vin} for r in res]
        return jsonify(data)
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод возвращает список всех арендованных машин пользователя
@app.route('/get_list_rent_car_for_user', methods=['GET'])
@jwt_required
def get_list_rent_car_for_user():
    try:
        user_login = get_jwt_identity()
        sql = f"select C.client_name, TD.test_drive_date, TD.test_drive_price from client C right join test_drive TD on C.client_id = TD.client_id where C.login = '{user_login}' order by C.client_name;"
        res = session.execute(sql)
        if res.rowcount > 0:
            data = [{"client_name": r.client_name, "test_drive_date": r.test_drive_date, "test_drive_price": r.test_drive_price.replace("$", "").replace("?", "").replace(' ', '')[:-1]} for r in res]
            return jsonify(data)
        else:
            return {"msg": "Список арендованных машин пуст!"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод возвращает основную информацию о машине по её VIN
@app.route('/get_info_car/<string:car_vin>', methods=['GET'])
@jwt_required
def get_info_car(car_vin: str):
    try:
        if len(car_vin)==17 and ' ' not in car_vin:
            sql = f"select M.model_mark, M.model_name, E.equipment_name, E.equipment_engine, E.equipment_drives, E.equipment_color, E.equipment_salon, C.vin, E.equipment_price from car C inner join equipment E on C.equipment_id = E.equipment_id left join model M on E.model_id = M.model_id where C.vin = '{car_vin}';"
            res = session.execute(sql)
            if res.rowcount > 0:
                data = [{"model_mark": r.model_mark, "model_name": r.model_name, "equipment_name": r.equipment_name, "equipment_engine": r.equipment_engine, "equipment_drives": r.equipment_drives, "equipment_color": r.equipment_color, "equipment_salon": r.equipment_salon, "one_hours_cost": r.equipment_price.replace("$", "").replace("?", "").replace(' ', '')[:-1], "vin": r.vin} for r in res]
                return jsonify(data)
            else:
                return {"msg": "Данная машина не найдена!"}, 400
        else:
            return {"msg": "Неправильный формат VIN"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод возвращает основную информацию о клиенте
@app.route('/get_client_info', methods=['GET'])
@jwt_required
def get_client_info():
    try:
        user_login = get_jwt_identity()
        res = session.query(Client).filter(Client.login == user_login).first()
        data = {"login": res.login, "client_name": res.client_name, "client_email": res.client_email, "client_birthday": res.client_birthday, "client_address": res.client_address, "client_passport": res.client_passport, "client_driver_license": res.client_driver_license, "client_first_license_date": res.client_first_license_date}
        return jsonify(data)
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод выставляет счет для определенного пользователя
@app.route('/send_order', methods=['POST'])
@jwt_required
def send_score():
    try:
        user_login = get_jwt_identity()
        res = session.query(Employee).filter(Employee.login == user_login).all()
        if len(res) == 1:
            params = request.json
            client_id = params.get('client_id')
            car_id = params.get('car_id')
            employee_id = res[0].employee_id
            order_date = f'{datetime.now():%Y-%m-%d}'
            order_clear_price = params.get('order_clear_price')
            order_price = float(order_clear_price) * 1.2
            new_order = Orders(client_id=client_id, car_id=car_id, employee_id=employee_id, order_date=order_date, order_clear_price=order_clear_price, order_price=order_price)
            session.add(new_order)
            session.commit()
            return {"msg": "Order has been send"}
        else:
            return {"msg": "Access denied"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод предназначен для получения счетов пользователя
@app.route('/get_score', methods=['GET'])
@jwt_required
def get_score():
    try:
        user_login = get_jwt_identity()
        sql = f"select c.login, c.client_name, o.order_id, o.car_id, o.employee_id, o.order_date, o.order_price, s.score_status, s.score_date from score s inner join orders o on s.order_id = o.order_id inner join client c on o.client_id = c.client_id where c.login='{user_login}';"
        res = session.execute(sql)
        data = []
        if res.rowcount > 0:
            for r in res:
                new_car = getInfoCarByID(session, r.car_id).json
                data.append({"client_name": r.client_name, "order_id": r.order_id, "car_id": new_car[0]["car_id"], "model_mark": new_car[0]["model_mark"], "model_name": new_car[0]["model_name"], "equipment_name": new_car[0]["equipment_name"], "equipment_engine": new_car[0]["equipment_engine"], "vin": new_car[0]["vin"], "employee_id": getEmployeeNameByID(session, Employee, r.employee_id), "order_date": r.order_date, "order_price": r.order_price.replace("$", "").replace("?", "").replace(' ', '')[:-1], "score_status": r.score_status, "score_date": r.score_date})
            return jsonify(data)
        else:
            return {"msg": "Данный клиент ничего не оформлял"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод предназначен для оформления тест-драйва
@app.route('/to_td', methods=['POST'])
@jwt_required
def to_test_drive():
    try:
        params = request.json
        user_login = get_jwt_identity()
        car_vin = params.get('vin')
        employee_name = params.get('employee_name')
        new_td = Test_drive(car_id=getCarIDByVIN(session, Car, car_vin), employee_id=getEmployeeIDByName(session, Employee, employee_name), client_id=getClientIDByLogin(session, Client, user_login), test_drive_date=params.get('test_drive_date'), test_drive_price=params.get('test_drive_price'), test_drive_status=0, test_drive_hours=params.get('test_drive_hours'))
        session.add(new_td)
        session.commit()
        return jsonify(new_td)
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод предназначен для оплаты счета пользователем
@app.route('/pay_score', methods=['PUT'])
@jwt_required
def pay_score():
    try:
        params = request.json
        res = session.query(Score).filter(Score.order_id == params.get('order_id')).first()
        if not res:
            return {"msg": "Записей не обнаружено"}, 400
        for key, value in params.items():
            setattr(res, key, value)
        session.commit()
        return {"msg": "Success"}
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод предназначен для обновления данных клиента
@app.route('/update_user', methods=['PUT'])
@jwt_required
def update_user():
    try:
        user_login = get_jwt_identity()
        params = request.json
        res = session.query(Client).filter(Client.login == user_login).first()
        if not res:
            return {"msg": "Данный пользователь не найден!"}, 400
        for key, value in params.items():
            setattr(res, key, value)
        session.commit()
        return {"msg": "Success"}
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод предназначен для получения истории проведенных тест-драйвов для менеджера
@app.route('/get_td_history_manager', methods=['GET'])
@jwt_required
def get_td_history_manager():
    try:
        user_login = get_jwt_identity()
        acc_type = getAccountTypeByName(session, user_login)
        if "Администратор" == acc_type or "Менеджер" == acc_type:
            employee_id = getEmployeeIDByLogin(session, Employee, user_login)
            sql = f"select td.employee_id, td.client_id, td.car_id, td.test_drive_date, td.test_drive_hours, td.test_drive_status from test_drive td inner join employee e on td.employee_id = e.employee_id where e.employee_id={employee_id};"
            res = session.execute(sql)
            if res.rowcount > 0:
                data = []
                for r in res:
                    new_car = getInfoCarByID(session, r.car_id).json
                    data.append({"employee_name": getEmployeeNameByID(session, Employee, r.employee_id), "client_name": getClientNameByID(session, Client, r.client_id), "car_model_mark": new_car[0]['model_mark'], "car_model_name": new_car[0]['model_name'], "car_equipment_name": new_car[0]['equipment_name'], "car_equipment_engine": new_car[0]['equipment_engine'], "car_vin": new_car[0]['vin'], "test_drive_date": r.test_drive_date, "test_drive_hours": r.test_drive_hours, "test_drive_status": r.test_drive_status})
                return jsonify(data)
            else:
                return {"msg": "Данный сотрудник не проводил тест-драйвы"}, 400
        else:
            return {"msg": "Access denied"}, 404
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод предназначен для обновления поля статуса тест-драйва
@app.route('/update_td_status', methods=['PUT'])
@jwt_required
def update_td_status():
    try:
        user_login = get_jwt_identity()
        acc_type = getAccountTypeByName(session, user_login)
        if "Администратор" == acc_type or "Менеджер" == acc_type:
            params = request.json
            td_id = params.get('test_drive_id')
            employee_id = getEmployeeIDByLogin(session, Employee, user_login)
            res = session.query(Test_drive).filter(Test_drive.test_drive_id == td_id, Test_drive.employee_id == employee_id).first()
            if not res:
                return {"msg": "Ничего не найдено!"}, 400
            for key, value in params.items():
                setattr(res, key, value)
            session.commit()
            return {"msg": "Success"}
        else:
            return {"msg": "Access denied"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод возвращает информацию обо всех менеджерах
@app.route('/get_managers_info', methods=['GET'])
@jwt_required
def get_managers_info():
    try:
        user_login = get_jwt_identity()
        acc_type = getAccountTypeByName(session, user_login)
        if "Администратор" == acc_type:
            sql = "select E.employee_id, E.employee_name, COUNT(O.order_id) as count from employee E inner join orders O on O.employee_id = E.employee_id group by E.employee_id, E.employee_name order by count;"
            res = session.execute(sql)
            data = [{"employee_name": r.employee_name, "test_drive_count": r.count} for r in res]
            return jsonify(data)
        else:
            return {"msg": "Access denied"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


# Данный метод для добавления нового автомобиля
@app.route('/create_new_car', methods=['POST'])
@jwt_required
def create_new_car():
    try:
        user_login = get_jwt_identity()
        acc_type = getAccountTypeByName(session, user_login)
        if "Администратор" == acc_type:
            params = request.json
            model_id = createModel(session, Model, **params)
            equipment_id = createEquipment(session, Equipment, model_id, **params)
            car = createCar(session, Car, equipment_id, **params)
            return {"msg": "Success"}
        else:
            return {"msg": "Access denied"}, 400
    except Exception as e:
        return {"msg": str(e)}, 400


if __name__ == '__main__':
    app.run(host='127.0.0.1', port='5000', debug=True)
