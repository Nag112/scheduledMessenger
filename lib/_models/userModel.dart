class UserModel {
  bool isAdmin;
  bool verified;
  String name;
  String mobile;

  UserModel({this.isAdmin, this.verified, this.name, this.mobile});

  UserModel.fromJson(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'];
    verified = json['verified'];
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAdmin'] = this.isAdmin;
    data['verified'] = this.verified;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    return data;
  }
}