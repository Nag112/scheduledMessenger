import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  String mobile = "";
  String pass = "";
  NavigationService _nav = locator<NavigationService>();
  onMobile(val) {
    mobile = val;
  }

  onPass(val) {
    pass = val;
  }

  forgotPassword() {}
  onSubmit() {}
  signup() {
    _nav.replaceWith(Routes.signUpScreen);
  }
}
