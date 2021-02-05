import 'package:messenger/_services/fcmService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';
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
      _nav.replaceWith(Routes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    _fcm.initService(context);
    return Scaffold(
      body: Center(
        child: "This is splashScreen".text.make(),
      ),
    );
  }
}
