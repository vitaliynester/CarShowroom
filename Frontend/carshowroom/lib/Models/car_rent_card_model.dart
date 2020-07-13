class CarRentCardModel {
  String carName;
  String image;
  int costOneHourse;
  String vin;
  int durationTd;

  CarRentCardModel(
      {this.carName,
      this.image,
      this.costOneHourse,
      this.vin = null,
      this.durationTd});
}
