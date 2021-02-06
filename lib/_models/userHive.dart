import 'package:hive/hive.dart';
part 'userHive.g.dart';

@HiveType(typeId: 1)
class UserHive {
  @HiveField(0)
  bool isAdmin;
  @HiveField(1)
  String name;
  @HiveField(2)
  String mobile;
  UserHive(this.isAdmin, this.name, this.mobile);
}
