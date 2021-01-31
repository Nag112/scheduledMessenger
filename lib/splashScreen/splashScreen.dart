import 'package:messenger/_services/apiService.dart';
import 'package:messenger/locator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  ApiService _api = locator<ApiService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: "This is splashScreen".text.make(),
      ),
    );
  }
}
