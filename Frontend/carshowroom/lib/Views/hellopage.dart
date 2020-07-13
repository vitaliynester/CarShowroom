import 'package:carshowroom/views/registerpage.dart';
import 'package:flutter/material.dart';

import 'Client/clientpage.dart';

class HelloPage extends StatefulWidget {
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e3747),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Авторизация",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF2e3747),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                width: MediaQuery.of(context).size.width * 0.95,
                image: AssetImage("assets/amg_gt_63s.png"),
              ),
              TextFieldContainer(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      hintText: "Ваш логин",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PasswordField(
                onChanged: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: RaisedButton(
                    color: Color(0xFF475366),
                    child: Text(
                      "Войти в аккаунт",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return ClientPage();
                      }))
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Еще не зарегестрированы?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      "Зарегистрироваться",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () => {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }))
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFF475366),
      ),
      child: child,
    );
  }
}

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const PasswordField({Key key, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: TextStyle(color: Colors.white),
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: "Ваш пароль",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none),
      ),
    );
  }
}
