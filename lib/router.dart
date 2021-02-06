import 'package:auto_route/auto_route_annotations.dart';
import 'authentication/login/loginScreen.dart';
import 'authentication/signUp/signUpScreen.dart';
import 'profile/profileScreen.dart';
import 'splashScreen/splashScreen.dart';
import 'authentication/otp/otp.dart';
import 'home/home.dart';
import 'newMessage/newMessage.dart';
import 'viewMessage/viewMessage.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: LoginScreen),
  MaterialRoute(page: SignUpScreen),
  MaterialRoute(page: OTPScreen),
  MaterialRoute(page: HomeScreen),
  MaterialRoute(page: NewMessageScreen),
  MaterialRoute(page: ViewMessageScreen),
  MaterialRoute(page: ProfileScreen)
])
class $Router {}
