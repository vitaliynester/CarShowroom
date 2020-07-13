import 'package:carshowroom/Models/score_client_model.dart';
import 'package:carshowroom/Views/scoreviewcard.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e3747),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              ScoreViewCard(
                  scoreClientModel: new ScoreClientModel(
                      "GT 63s",
                      "Mercedes",
                      DateTime.parse("2020-06-12"),
                      "Steffen Mallison",
                      4120000,
                      "4.0, 9 цилиндров",
                      false,
                      "GT 63s",
                      DateTime.now())),
              SizedBox(height: 15),
              ScoreViewCard(
                  scoreClientModel: new ScoreClientModel(
                      "A7 2020",
                      "Audi",
                      DateTime.parse("2020-06-12"),
                      "Steffen Mallison",
                      170000,
                      "2.0, 4 цилиндра",
                      true,
                      "45 TFSI Sportback",
                      DateTime.now())),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
