import 'package:auto_route/auto_route_annotations.dart';
import 'package:messenger/authentication/login/loginScreen.dart';
import 'package:messenger/authentication/signUp/signUpScreen.dart';
import 'package:messenger/profile/profileScreen.dart';
import 'package:messenger/splashScreen/splashScreen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: LoginScreen),
  MaterialRoute(page: SignUpScreen),
  MaterialRoute(page: ProfileScreen)
])
class $Router {}
