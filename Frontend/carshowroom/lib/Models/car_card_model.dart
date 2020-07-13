import 'package:flutter/cupertino.dart';

class CarCardModel {
  String carName;
  String image;
  int durationTd;
  double costTd;
  DateTime dateTimeTd;
  String vin;

  CarCardModel({this.dateTimeTd, this.costTd, this.durationTd, this.carName, this.image, this.vin=null});
}