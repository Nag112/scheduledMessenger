// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'authentication/login/loginScreen.dart';
import 'authentication/signUp/signUpScreen.dart';
import 'profile/profileScreen.dart';
import 'splashScreen/splashScreen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String profileScreen = '/profile-screen';
  static const all = <String>{
    splashScreen,
    loginScreen,
    signUpScreen,
    profileScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },
  };
}
