import 'package:messenger/_services/userService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  UserService _user = locator<UserService>();
  NavigationService _nav = locator<NavigationService>();
  logout() async {
    await _user.logout();
    _nav.clearStackAndShow(Routes.loginScreen);
  }
}
