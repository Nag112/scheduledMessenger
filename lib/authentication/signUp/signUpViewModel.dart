import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  NavigationService _nav = locator<NavigationService>();
  onText(val, type) {
    switch (type) {
      case 'mobile':
        break;
      case 'cpass':
        break;
      case 'pass':
        break;
      case 'username':
        break;
      default:
    }
  }

  signin() {
    _nav.replaceWith(Routes.loginScreen);
  }

  onSubmit() {}
}
