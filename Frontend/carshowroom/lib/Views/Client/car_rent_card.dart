import 'package:carshowroom/Models/car_about_model.dart';
import 'package:carshowroom/Models/car_rent_card_model.dart';
import 'package:carshowroom/Views/Client/rent_car_about_page.dart';
import 'package:flutter/material.dart';

class CarRentCard extends StatelessWidget {
  final CarRentCardModel carCardModel;
  CarRentCard({this.carCardModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RentCarAboutPage(
            carAboutModel: CarAboutModel(carCardModel.vin),
          );
        }))
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
              color: Color(0xFF475366),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(carCardModel.image),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      carCardModel.carName,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text("Стоимость часа: ${carCardModel.costOneHourse}",
                        style: TextStyle(color: Color(0xFFcdccd7)))
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
