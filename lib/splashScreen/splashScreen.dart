import 'package:messenger/_services/fcmService.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService _nav = locator<NavigationService>();
  FcmService _fcm = locator<FcmService>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      UserService _user = locator<UserService>();
      if (_user.userToken != null && _user.userToken != "") {
        _nav.replaceWith(Routes.homeScreen);
      } else {
        _nav.replaceWith(Routes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _fcm.initService(context);
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/ic_launcher.png',
                height: size.height * 0.1,
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor,
                  fontSize: size.width * 0.10,
                ),
              ),
            ]),
      ),
    );
  }
}
