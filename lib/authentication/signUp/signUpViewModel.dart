import 'package:messenger/_services/apiService.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  NavigationService _nav = locator<NavigationService>();
  UtilsService _utils = locator<UtilsService>();
  ApiService _api = locator<ApiService>();
  UserService _userService = locator<UserService>();
  Map _user = {
    "mobile": "",
    "deviceToken": "",
    "name": "",
    "password": "",
  };
  String cpass = "";
  onText(val, type) {
    switch (type) {
      case 'mobile':
        _user['mobile'] = val;
        break;
      case 'cpass':
        cpass = val;
        break;
      case 'pass':
        _user['password'] = val;
        break;
      case 'username':
        _user['name'] = val;
        break;
      default:
    }
  }

  signin() {
    _nav.replaceWith(Routes.loginScreen);
  }

  onSubmit() {
    bool _error = false;
    _user['deviceToken'] = _userService.deviceToken;
    _user.forEach((key, val) {
      if (val == "") {
        _error = true;
      }
    });
    if (!_error) {
      if (cpass != _user['password']) {
        _utils.showToast(msg: "Passwords doesn't match");
      } else {
        _api.signUp(_user).then((resp) {
          if (resp != null) {
            _userService.mobile = _user["mobile"];
            print(_userService.mobile);
            _utils.sendOTP(_user["mobile"]);
            _nav.navigateTo(Routes.oTPScreen);
          }
        });
      }
    } else {
      _utils.showToast(msg: "Please fill all the details");
    }
  }
}
