import 'package:messenger/_services/userService.dart';
import 'package:messenger/locator.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  UserService _user = locator<UserService>();
  bool get isAdmin => _user.loggedUser.isAdmin;
}
