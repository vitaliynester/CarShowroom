class CarAboutModel {
  String vin;
  String modelMark;
  String modelName;
  String equipmentName;
  String equipmentEngine;
  String equipmentDrives;
  String equipmentColor;
  String equipmentSalon;
  String image;
  double costOneHourseTD;

  CarAboutModel(String vinNum) {
    this.vin = vinNum;
    this.modelMark = "Mercedes";
    this.modelName = "GT 63s";
    this.equipmentName = "GLS 640 сил";
    this.equipmentEngine = "2.0, 4 цилиндра";
    this.equipmentDrives = "22 дюйма";
    this.equipmentColor = "Чёрный, металлик";
    this.equipmentSalon = "G manufaktur";
    this.image = "assets/amg_gt_63s.png";
    costOneHourseTD = 8750;
  }
}