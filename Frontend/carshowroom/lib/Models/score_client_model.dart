class ScoreClientModel {
  String modelName;
  String modelMark;
  String modelEngine;
  String equipmentName;
  String employeeName;
  DateTime dateTimeScore;
  DateTime dateTimePayed;
  int finalPrice;
  bool payed;

  ScoreClientModel(this.modelName, this.modelMark, this.dateTimeScore, this.employeeName, this.finalPrice, this.modelEngine, this.payed, this.equipmentName, this.dateTimePayed);
}