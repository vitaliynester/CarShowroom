import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e3747),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              child: Text(
                "Настройки профиля",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/empty.jpg"),
                      radius: 65,
                    ),
                    onTap: () => {print("Таб по картинке")},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Изменить фото профиля",
                      style: TextStyle(color: Color(0xFF858a99)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: Color(0xFF858a99),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "Логин профиля",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "enaton2",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Color(0xFF858a99)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Color(0xFF858a99),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "Имя профиля",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "Shayla Pendleberry",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Color(0xFF858a99)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Color(0xFF858a99),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "Почта профиля",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "spendleberry2@ehow.com",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Color(0xFF858a99)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Color(0xFF858a99),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "Дата рождения",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "1965-03-17",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Color(0xFF858a99)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Color(0xFF858a99),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "Адрес профиля",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "3 Green Ridge Street",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Color(0xFF858a99)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Color(0xFF858a99),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "Водительское удостоверение",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "4219706148",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Color(0xFF858a99)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.95,
            color: Color(0xFF858a99),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Center(
                  child: Text(
                    "Дата выдачи первых прав",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    "2005-11-12",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, color: Color(0xFF858a99)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Color(0xFF858a99),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: RaisedButton(
                  color: Color(0xFF475366),
                  child: Text(
                    "Сохранить изменения",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () => { },
                ),
              ),
          )
        ],
      ),
    );
  }
}
