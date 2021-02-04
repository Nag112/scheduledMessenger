import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _nav = locator<NavigationService>();

  UtilsService _utils = locator<UtilsService>();
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
    _nav.navigateTo(Routes.oTPScreen);
    if (mobile != "" && pass != "") {
      // await _utils.sendOTP(mobile, () {
      //   _nav.navigateTo(Routes.oTPScreen);
      // });
    } else {
      _utils.showToast(msg: "Please fill all the details");
    }
  }

  signup() {
    _nav.replaceWith(Routes.signUpScreen);
  }
}
