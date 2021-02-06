import 'package:messenger/_services/apiService.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  bool _isBusy = true;
  bool get isBusy => _isBusy;
  ApiService _api = locator<ApiService>();
  NavigationService _nav = locator<NavigationService>();
  UserService _user = locator<UserService>();
  bool get isAdmin => _user.loggedUser.isAdmin;
  onReady() {
    _api.getMessages().then((resp) {
      print(resp);
    }).catchError((e) {});
  }

  profilePage() {
    _nav.navigateTo(Routes.profileScreen);
  }

  addMessage() {
    if (_user.loggedUser.isAdmin) {
      _nav.navigateTo(Routes.newMessageScreen);
    }
  }
}
