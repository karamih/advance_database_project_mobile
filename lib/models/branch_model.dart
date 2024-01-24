class BranchModel {
  BranchModel({
      this.aCity, 
      this.aStreet, 
      this.aPhoneNo,});

  BranchModel.fromJson(dynamic json) {
    aCity = json['A_city'];
    aStreet = json['A_street'];
    aPhoneNo = json['A_phoneNo'];
  }
  String? aCity;
  String? aStreet;
  String? aPhoneNo;
}