import 'package:flutter/material.dart';

import 'hellopage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e3747),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Регистрация",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF2e3747),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      hintText: "Логин",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintText: "Пароль",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      hintText: "Повторите пароль",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      hintText: "Номер телефона",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                      ),
                      hintText: "ФИО",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      hintText: "Электронная почта",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      hintText: "Дата рождения",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.gps_fixed,
                        color: Colors.white,
                      ),
                      hintText: "Адрес проживания",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.tab,
                        color: Colors.white,
                      ),
                      hintText: "Серия и номер паспорта",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.tablet,
                        color: Colors.white,
                      ),
                      hintText: "Номер водительского удостоверения",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      hintText: "Дата выдачи первых прав",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: RaisedButton(
                    color: Color(0xFF475366),
                    child: Text(
                      "Зарегестрироваться",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () => {},
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Уже имеется аккаунт?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Авторизоваться",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return HelloPage();
                      }))
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
