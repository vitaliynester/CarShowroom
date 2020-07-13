import 'package:carshowroom/Models/car_rent_card_model.dart';
import 'package:carshowroom/Views/Client/car_rent_card.dart';
import 'package:flutter/material.dart';

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e3747),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              CarRentCard(
                carCardModel: new CarRentCardModel(
                    image: "assets/amg_gt_63s.png",
                    carName: "Mercedes GT 63s",
                    costOneHourse: 8750),
              ),
              CarRentCard(
                carCardModel: new CarRentCardModel(
                    image: "assets/audi-a7.png",
                    carName: "Audi A7 2020",
                    costOneHourse: 13075),
              ),
              CarRentCard(
                carCardModel: new CarRentCardModel(
                    image: "assets/audi-q8.png",
                    carName: "Audi Q8 2020",
                    costOneHourse: 19400),
              ),
              CarRentCard(
                carCardModel: new CarRentCardModel(
                    image: "assets/bmw-i8.png",
                    carName: "BMW i8 2018",
                    costOneHourse: 7500),
              )              
            ],
          ),
        ),
      ),
    );
  }
}
