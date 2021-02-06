import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/locator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType { greenAndRed, redAndWhite }

@lazySingleton
class UtilsService {
  final SnackbarService _snackBar = locator<SnackbarService>();
  String _verificationId;
  UtilsService() {
    setupSnackbarUi();
  }
  showErrorSnackBar({title, msg}) {
    _snackBar.showCustomSnackBar(
      variant: SnackbarType.redAndWhite,
      message: msg,
      title: title,
      duration: Duration(seconds: 5),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => {},
    );
  }

  showSnackBar({title, msg}) {
    _snackBar.showSnackbar(
      message: msg,
      title: title,
      duration: Duration(seconds: 5),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => {},
    );
  }

  sendOTP(mobile) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this._verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResent]) {
      this._verificationId = verId;
      showToast(msg: "An OTP has been sent", background: kPrimaryColor);
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {};
    final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e) {
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$mobile",
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

  Future verifyOTP(otp) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      showToast(msg: e.message);
      return false;
    }
  }

  showToast({background = kErrorPrimaryColor, textColor = Colors.white, msg}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: background,
        textColor: textColor,
        fontSize: 16.0);
  }

  void setupSnackbarUi() {
    final service = locator<SnackbarService>();
    // Registers a config to be used when calling showSnackbar
    service.registerSnackbarConfig(
      SnackbarConfig(
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        borderRadius: 0,
        margin: EdgeInsets.zero,
      ),
    );
    service.registerCustomSnackbarConfig(
      variant: SnackbarType.greenAndRed,
      config: SnackbarConfig(
        backgroundColor: Colors.white,
        titleColor: Colors.green,
        messageColor: Colors.red,
        borderRadius: 1,
      ),
    );
    service.registerCustomSnackbarConfig(
      variant: SnackbarType.redAndWhite,
      config: SnackbarConfig(
        backgroundColor: Colors.red,
        titleColor: Colors.white,
        messageColor: Colors.white,
        borderRadius: 1,
      ),
    );
  }
}
