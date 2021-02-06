import 'package:messenger/_services/userService.dart';
import 'package:messenger/locator.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  UserService _user = locator<UserService>();
  String mobile;
  onMobile(val) {
    mobile = val;
  }
  onSubmit()
  {
    
  }
}
