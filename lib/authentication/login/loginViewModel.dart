import 'package:messenger/_models/userModel.dart';
import 'package:messenger/_services/apiService.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _nav = locator<NavigationService>();
  UtilsService _utils = locator<UtilsService>();
  ApiService _api = locator<ApiService>();
  UserService _user = locator<UserService>();
  String mobile = "";
  String pass = "";

  get verifiedSuccess => null;
  onMobile(val) {
    mobile = val;
  }

  onPass(val) {
    pass = val;
  }

  forgotPassword() {
    
  }

  Future<void> onSubmit() async {
    if (mobile != "" && pass != "") {
      _api.login({"mobile": mobile, "password": pass}).then((resp) {
        _user.loggedUser = UserModel.fromJson(resp['data']);
        _user.setUserToken(resp['token']);
      }).catchError((e) {});
    } else {
      _utils.showToast(msg: "Please fill all the details");
    }
  }

  signup() {
    _nav.replaceWith(Routes.signUpScreen);
  }
}
