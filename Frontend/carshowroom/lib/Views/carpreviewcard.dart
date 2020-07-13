import 'package:carshowroom/Models/car_card_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarPreviewCard extends StatelessWidget {
  final CarCardModel carCardModel;
  CarPreviewCard({this.carCardModel});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                width: 200,
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
                  Text(
                    "${carCardModel.durationTd} часов",
                    style: TextStyle(color: Color(0xFFcdccd7)),
                  ),
                  Text(
                    "${carCardModel.costTd} рублей",
                    style: TextStyle(color: Color(0xFFcdccd7)),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd')
                        .format(carCardModel.dateTimeTd)
                        .toString(),
                    style: TextStyle(color: Color(0xFFcdccd7)),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
