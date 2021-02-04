import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:stacked/stacked.dart';

class OTPViewModel extends BaseViewModel {
  UtilsService _utils = locator<UtilsService>();

  bool enableOtp = true;
  String otp;
  onSubmit() {
    if (otp != null && otp.length > 4) {
      _utils.verifyOTP(otp);
    } else {
      _utils.showToast(msg: "Please enter the OTP");
    }
  }

  onEnter(val) {
    otp = val;
  }
}
