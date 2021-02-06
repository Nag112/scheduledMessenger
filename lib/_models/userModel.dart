class UserModel {
  bool isAdmin;
  String name;
  String mobile;

  UserModel({this.isAdmin, this.name, this.mobile});

  UserModel.fromJson(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'];
    name = json['name'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAdmin'] = this.isAdmin;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    return data;
  }
}