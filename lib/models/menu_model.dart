class MenuModel {
  MenuModel({
    this.aItemName,
    this.aPrice,
    this.aAverageScore,
  });

  MenuModel.fromJson(dynamic json) {
    aItemName = json['A_itemName'];
    aPrice = json['A_price'];
    aAverageScore = json['A_averageScore'];
  }

  String? aItemName;
  int? aPrice;
  double? aAverageScore;
}
