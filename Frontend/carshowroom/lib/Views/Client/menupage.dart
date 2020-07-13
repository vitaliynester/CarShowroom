import 'package:carshowroom/Models/car_card_model.dart';
import 'package:carshowroom/Views/carpreviewcard.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool left_block = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e3747),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/empty.jpg"),
                radius: 65,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Добро пожаловать",
              style: TextStyle(fontSize: 14, color: Color(0xFF858a99)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Shayla Pendleberry",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Color(0xFF475366),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF475366),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        left_block = true;
                      });
                    },
                    child: AnimatedContainer(
                      height: 50,
                      width: 100,
                      duration: Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            left_block ? Color(0xFF272f40) : Color(0xFF475366),
                      ),
                      child: Icon(
                        Icons.directions_car,
                        color: left_block ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        left_block = false;
                      });
                    },
                    child: AnimatedContainer(
                      height: 50,
                      width: 100,
                      duration: Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:
                            left_block ? Color(0xFF475366) : Color(0xFF272f40),
                      ),
                      child: Icon(
                        Icons.done,
                        color: left_block ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            left_block == true
                ? Column(
                    children: <Widget>[
                      CarPreviewCard(
                        carCardModel: new CarCardModel(
                            image: "assets/amg_gt_63s.png",
                            carName: "Mercedes GT 63s",
                            durationTd: 48,
                            costTd: 420000,
                            dateTimeTd: DateTime.parse("2020-06-25")),
                      ),
                      CarPreviewCard(
                        carCardModel: new CarCardModel(
                            image: "assets/audi-a7.png",
                            carName: "Audi A7 2020",
                            durationTd: 13,
                            costTd: 170000,
                            dateTimeTd: DateTime.parse("2020-06-19")),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      CarPreviewCard(
                        carCardModel: new CarCardModel(
                            image: "assets/audi-q8.png",
                            carName: "Audi Q8 2020",
                            durationTd: 5,
                            costTd: 97000,
                            dateTimeTd: DateTime.parse("2020-05-10")),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
