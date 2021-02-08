class Message {
  List users;
  String sId;
  int time;
  String message;
  String createdAt;
  String updatedAt;
  
  Message(
      {this.users,
      this.sId,
      this.time,
      this.message,
      this.createdAt,
      this.updatedAt,
      });

  Message.fromJson(Map<String, dynamic> json) {
    users = json['users'];
    sId = json['_id'];
    time = json['time'];
    message = json['message'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users'] = this.users;
    data['_id'] = this.sId;
    data['time'] = this.time;
    data['message'] = this.message;
    return data;
  }
}