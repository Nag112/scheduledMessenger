import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/_models/userHive.dart';
import 'package:messenger/_models/userModel.dart';

@lazySingleton
class UserService {
  UserService() {
    Hive.openBox("user").then((box) {
      _userToken = box.get("token");
    });
  }
  Map signupData = {};
  String deviceToken;
  String _userToken;
  String get userToken => _userToken;
  setUserToken(String token) {
    _userToken = token;
    var box = Hive.box("user");
    box.put("token", token);
    box.put("user",
        UserHive(loggedUser.isAdmin, loggedUser.mobile, loggedUser.name));
  }

  UserModel loggedUser;
}
