import 'package:flutter/material.dart';
import 'package:messenger/_services/apiService.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OTPViewModel extends BaseViewModel {
  UtilsService _utils = locator<UtilsService>();
  TextEditingController otpController = new TextEditingController();
  NavigationService _nav = locator<NavigationService>();
  ApiService _api = locator<ApiService>();
  UserService _user = locator<UserService>();
  final FocusNode pinPutFocusNode = FocusNode();
  bool enableOtp = true;
  String otp;

  onSubmit() async {
    if (otp != null && otp.length > 4) {
      bool resp = await _utils.verifyOTP(otp);
      if (resp) {
        var result = await _api.updateVerify({"mobile": _user.mobile});
        if (result != null) {
          _nav.navigateTo(Routes.loginScreen);
        }
      }
    }
  }

  resend() {
    print(_user.mobile);
    _utils.sendOTP(_user.mobile);
  }

  onEnter(val) {
    otp = val;
  }
}
