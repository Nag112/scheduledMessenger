import 'package:hive/hive.dart';
part 'messageHive.g.dart';

@HiveType(typeId: 2)
class MessageHive {
  @HiveField(0)
  List users;
  @HiveField(1)
  String sId;
  @HiveField(2)
  int time;
  @HiveField(3)
  String message;
  @HiveField(4)
  String createdAt;
  @HiveField(5)
  String updatedAt;
  MessageHive(
      {this.users,
      this.sId,
      this.time,
      this.message,
      this.createdAt,
      this.updatedAt});
}
