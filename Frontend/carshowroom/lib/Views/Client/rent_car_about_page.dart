import 'package:carshowroom/Models/car_about_model.dart';
import 'package:flutter/material.dart';

class RentCarAboutPage extends StatefulWidget {
  final CarAboutModel carAboutModel;
  RentCarAboutPage({this.carAboutModel});
  double _valueHourse = 1;

  @override
  _RentCarAboutPageState createState() => _RentCarAboutPageState();
}

class _RentCarAboutPageState extends State<RentCarAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2e3747),
        title: Text(
            "${widget.carAboutModel.modelMark} ${widget.carAboutModel.modelName}"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF2e3747),
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.carAboutModel.image))),
            ),
            Text(
              "Двигатель: ${widget.carAboutModel.equipmentName}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Характеристики двигателя: ${widget.carAboutModel.equipmentEngine}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Диски: ${widget.carAboutModel.equipmentDrives}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Цвет кузова: ${widget.carAboutModel.equipmentColor}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Характеристики салона: ${widget.carAboutModel.equipmentSalon}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Стоимость часа: ${widget.carAboutModel.costOneHourseTD}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Slider(
                value: widget._valueHourse,
                divisions: 24,
                min: 1,
                max: 24,
                activeColor: Colors.white,
                inactiveColor: Colors.black,
                onChanged: (double value) {
                  setState(() {
                    widget._valueHourse = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Оформить тест-драйв на ${widget._valueHourse.toStringAsFixed(0)} ${hoursString()}",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              "Итоговая стоимость: ${(int.parse(widget._valueHourse.toStringAsFixed(0)) * widget.carAboutModel.costOneHourseTD).toStringAsFixed(0)} рублей",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: RaisedButton(
                  color: Color(0xFF475366),
                  child: Text(
                    "Записаться на тест-драйв",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                        duration: Duration(milliseconds: 3000),
                        content: Text(
                          "Вы успешно записались на тест-драйв! \nСкоро с Вами свяжется менеджер!",
                          textAlign: TextAlign.center,
                        ));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String hoursString() {
    switch (int.parse(widget._valueHourse.toStringAsFixed(0))) {
      case 1:
      case 21:
        return "час";
      case 2:
      case 3:
      case 4:
      case 22:
      case 23:
      case 24:
        return "часа";
      default:
        return "часов";
    }
  }
}