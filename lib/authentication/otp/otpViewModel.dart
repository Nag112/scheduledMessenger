import 'package:flutter/material.dart';
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
  UserService _user = locator<UserService>();
  final FocusNode pinPutFocusNode = FocusNode();
  bool enableOtp = true;
  String otp;
  onSubmit() async {
    if (otp != null && otp.length > 4) {
      bool resp = await _utils.verifyOTP(otp);
      if (resp) {
        _nav.navigateTo(Routes.loginScreen);
      }
    }
  }

  resend() {
    _utils.sendOTP(_user.signupData['mobile']);
  }

  onEnter(val) {
    otp = val;
  }
}
