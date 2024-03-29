import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/_models/userHive.dart';
import 'package:messenger/_models/userModel.dart';

@lazySingleton
class UserService {
  UserService() {
    Hive.openBox("user").then((box) {
      _userToken = box.get("token");
      UserHive _user = box.get("user");
      if (_user != null) {
        loggedUser = UserModel(
            isAdmin: _user.isAdmin, mobile: _user.mobile, name: _user.name);
      }
    });
  }
  String mobile;
  String deviceToken;
  String _userToken;
  String get userToken => _userToken;

  setUserToken(String token) {
    _userToken = token;
    var box = Hive.box("user");
    box.put("token", token);
    box.put(
        "user",
        UserHive(
          loggedUser.isAdmin,
          loggedUser.name,
          loggedUser.mobile,
        ));
  }

  UserModel loggedUser;

  Future logout() async {
    await Hive.box("user").clear();
    loggedUser = null;
    mobile = null;
    _userToken = null;
  }
}
