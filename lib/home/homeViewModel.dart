import 'package:messenger/_models/message.dart';
import 'package:messenger/_services/apiService.dart';
import 'package:messenger/_services/messagesService.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeViewModel extends ReactiveViewModel {
  bool _isBusy = false;
  bool get isBusy => _isBusy;
  ApiService _api = locator<ApiService>();
  NavigationService _nav = locator<NavigationService>();
  UserService _user = locator<UserService>();
  MessagesService _messagesService = locator<MessagesService>();
  bool get isAdmin => _user.loggedUser.isAdmin;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<ReactiveServiceMixin> get reactiveServices => [_messagesService];
  List<Message> get messages =>
      List<Message>.from(_messagesService.messages.reversed);

  fetchMessages() {
    _messagesService.fetchMessages();
  }

  onRefresh() {
    _messagesService.fetchMessages();
    refreshController.refreshCompleted();
  }

  profilePage() {
    _nav.navigateTo(Routes.profileScreen);
  }

  onMessageOption(val, ind) {
    if (isAdmin) {
      if (val == 0) {
        _nav.navigateTo(Routes.newMessageScreen,
            arguments: {'msg': messages[ind]});
      } else if (val == 1) {
        _api.deleteMessage(messages[ind].sId).then((resp) {
          print(resp);
          _messagesService.fetchMessages();
        }).catchError((err) {});
      }
    }
  }

  addMessage() {
    if (isAdmin) {
      _nav.navigateTo(Routes.newMessageScreen);
    }
  }
}
