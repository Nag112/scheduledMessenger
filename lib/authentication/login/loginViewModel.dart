import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _nav = locator<NavigationService>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UtilsService _utils = locator<UtilsService>();
  TextEditingController _codeController = new TextEditingController();
  String mobile = "";
  String pass = "";
  String _verifId;
  String _code;
  onMobile(val) {
    mobile = val;
  }

  onPass(val) {
    pass = val;
  }

  forgotPassword() {}
  onSubmit(context) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      _verifId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verID, [int forceCodeResend]) {
      _verifId = verID;
    };
    final PhoneVerificationCompleted verifiedSuccess =
        (PhoneAuthCredential user) {
      print("verified $user");
    };
    if (mobile != "" && pass != "") {
      try {
        await _auth.verifyPhoneNumber(
            phoneNumber: "+91$mobile",
            timeout: Duration(seconds: 20),
            verificationCompleted: verifiedSuccess,
            codeSent: (String verificationId, [int forceResendingToken]) {
              print(verificationId);
            },
            codeAutoRetrievalTimeout: autoRetrieve,
            verificationFailed: (err) {
              print(err.message);
            });
      } catch (e) {
        print(e.toString());
      }
    } else {
      _utils.showToast(msg: "Please fill all the details");
    }
  }

  signup() {
    _nav.replaceWith(Routes.signUpScreen);
  }
}
