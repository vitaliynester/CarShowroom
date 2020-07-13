from flask import jsonify
from flask_jwt_extended import create_access_token
from datetime import timedelta
from passlib.hash import sha512_crypt


def get_token(User, expire_time=1):
    expire_delta = timedelta(expire_time)
    token = create_access_token(identity=User.login, expires_delta=expire_delta)
    return token


def authenticate(session, Account, **kwargs):
    login = kwargs.get('login')
    password = kwargs.get('password')
    user = session.query(Account).filter(Account.login == login).one()
    if not sha512_crypt.verify(password, user.password):
        raise Exception("No user with this password")
    return user


def registerAccount(Account, **kwargs):
    login = kwargs.get('login')
    password = sha512_crypt.hash(kwargs.get('password'))
    phone_number = kwargs.get('phone_number')
    return Account(login=login, password=password, phone_number=phone_number)


def existAccount(session, Account, **kwargs):
    login = kwargs.get('login')
    user = session.query(Account).filter(Account.login == login).first()
    if user:
        return True
    return False


def registerClient(Client, **kwargs):
    try:
        login = kwargs.get('login')
        client_name = kwargs.get('client_name')
        client_email = kwargs.get('client_email')
        client_birthday = kwargs.get('client_birthday')
        client_address = kwargs.get('client_address')
        client_passport = kwargs.get('client_passport')
        client_driver_license = kwargs.get('client_driver_license')
        client_first_license_date = kwargs.get('client_first_license_date')
        return Client(login=login, client_name=client_name, client_email=client_email, client_birthday=client_birthday,
                      client_address=client_address, client_passport=client_passport,
                      client_driver_license=client_driver_license, client_first_license_date=client_first_license_date)
    except Exception as e:
        raise e


def getEmployeeNameByID(session, Employee, id):
    try:
        res = session.query(Employee).filter(Employee.employee_id == id).first()
        return res.employee_name
    except Exception as e:
        raise e


def getClientIDByLogin(session, Client, client_login):
    try:
        res = session.query(Client).filter(Client.login == client_login).first()
        if not res:
            raise Exception("Пользователь не найден!")
        return res.client_id
    except Exception as e:
        raise e


def getEmployeeIDByName(session, Employee, name):
    try:
        res = session.query(Employee).filter(Employee.employee_name == name).first()
        if not res:
            raise Exception("Данный сотрудник не найден!")
        return res.employee_id
    except Exception as e:
        raise e


def getEmployeeIDByLogin(session, Employee, login):
    try:
        res = session.query(Employee).filter(Employee.login == login).first()
        if not res:
            raise Exception("Данный сотрудник не найден!")
        return res.employee_id
    except Exception as e:
        raise e


def getClientNameByID(session, Client, client_id):
    try:
        res = session.query(Client).filter(Client.client_id == client_id).first()
        if not res:
            raise Exception("Данный пользователь не найден!")
        return res.client_name
    except Exception as e:
        raise e


def getCarIDByVIN(session, Car, vin):
    try:
        res = session.query(Car).filter(Car.vin == vin).first()
        if not res:
            raise Exception("Данная машина не найдена!")
        return res.car_id
    except Exception as e:
        raise e


def getInfoCarByID(session, id):
    try:
        sql = f"select C.car_id, M.model_mark, M.model_name, E.equipment_name, E.equipment_engine, C.vin from car C inner join equipment E on C.equipment_id = E.equipment_id left join model M on E.model_id = M.model_id where c.car_id={id};"
        res = session.execute(sql)
        if res.rowcount > 0:
            data = [{"car_id": r.car_id, "model_mark": r.model_mark, "model_name": r.model_name, "equipment_name": r.equipment_name, "equipment_engine": r.equipment_engine, "vin": r.vin} for r in res]
            return jsonify(data)
        else:
            raise Exception("No car with that ID")
    except Exception as e:
        raise e


def getAccountTypeByName(session, name):
    try:
        acc_type = ""
        sql = f"select employee_position from employee where login='{name}';"
        res = session.execute(sql)
        if res.rowcount > 0:
            data = [r.employee_position for r in res]
            acc_type = data[0]
        else:
            sql = f"select client_id from client where client_name='{name}';"
            res = session.execute(sql)
            if res.rowcount > 0:
                acc_type = "Клиент"
        return acc_type
    except Exception as e:
        raise e


def createModel(session, Model, **kwargs):
    try:
        model_name = kwargs.get('model_name')
        model_mark = kwargs.get('model_mark')
        new_model = Model(model_name=model_name, model_mark=model_mark)
        session.add(new_model)
        session.commit()
        return new_model.model_id
    except Exception as e:
        raise e


def createEquipment(session, Equipment, model_id, **kwargs):
    try:
        equipment_name = kwargs.get('equipment_name')
        equipment_price = kwargs.get('equipment_price')
        equipment_engine = kwargs.get('equipment_engine')
        equipment_drives = kwargs.get('equipment_drives')
        equipment_color = kwargs.get('equipment_color')
        equipment_salon = kwargs.get('equipment_salon')
        new_equipment = Equipment(model_id=model_id, equipment_name=equipment_name, equipment_price=equipment_price, equipment_engine=equipment_engine, equipment_drives=equipment_drives, equipment_color=equipment_color, equipment_salon=equipment_salon)
        session.add(new_equipment)
        session.commit()
        return new_equipment.equipment_id
    except Exception as e:
        raise e


def createCar(session, Car, equipment_id, **kwargs):
    try:
        vin = kwargs.get('vin')
        new_car = Car(equipment_id=equipment_id, vin=vin)
        session.add(new_car)
        session.commit()
        return new_car
    except Exception as e:
        raise e
