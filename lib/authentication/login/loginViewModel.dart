import 'package:messenger/_models/userModel.dart';
import 'package:messenger/_services/apiService.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  bool _isBusy = false;
  bool get isBusy => _isBusy;
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

  forgotPassword() {}

  Future<void> onSubmit() async {
    if (mobile != "" && pass != "") {
      _isBusy = true;
      notifyListeners();
      _api.login({"mobile": mobile, "password": pass}).then((resp) {
        print(resp);
        if (resp['data']['verified']) {
          _user.loggedUser = UserModel.fromJson(resp['data']);
          _user.setUserToken(resp['token']);
          _nav.clearStackAndShow(Routes.homeScreen);
        } else {
          _utils.sendOTP(mobile);
          _user.mobile = mobile;
          _nav.navigateTo(Routes.oTPScreen);
        }
      }).catchError((e) {
        // print(e);
        _isBusy = false;
        notifyListeners();
      });
    } else {
      _utils.showToast(msg: "Please fill all the details");
    }
    _isBusy = false;
    notifyListeners();
  }

  signup() {
    _nav.replaceWith(Routes.signUpScreen);
  }
}
