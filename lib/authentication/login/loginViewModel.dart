import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future<void> onSubmit(context) async {
    await _utils.sendOTP(mobile, () {
      _nav.navigateTo(Routes.signUpScreen);
    });
  }

  signup() {
    _nav.replaceWith(Routes.signUpScreen);
  }
}
