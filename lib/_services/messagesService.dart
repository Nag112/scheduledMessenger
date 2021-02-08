import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/_models/message.dart';
import 'package:messenger/_models/messageHive.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_ish/observable_ish.dart';

import 'apiService.dart';

@lazySingleton
class MessagesService with ReactiveServiceMixin {
  ApiService _api = locator<ApiService>();
  UtilsService _utilsService = locator<UtilsService>();
  MessagesService() {
    Hive.openBox("messages").then((box) {
      List<MessageHive> _tempMessages = box.values
          .map((ele) {
            return ele;
          })
          .toList()
          .cast<MessageHive>();
      if (_tempMessages != null) {
        _messages.value = _tempMessages
            .map((ele) {
              return Message(
                  createdAt: ele.createdAt,
                  updatedAt: ele.updatedAt,
                  users: ele.users,
                  message: ele.message,
                  sId: ele.sId);
            })
            .toList()
            .cast<Message>();
      } else {
        print("No messages");
      }
    });
  }

  RxValue<List<Message>> _messages = RxValue<List<Message>>(initial: []);
  List<Message> get messages => _messages.value;
  fetchMessages() async {
    try {
      var resp = await _api.getMessages();
      _messages.value = resp['data']
          .map((ele) {
            return Message.fromJson(ele);
          })
          .toList()
          .cast<Message>();
      notifyListeners();
      var _messBox = _messages.value
          .map((ele) {
            return MessageHive(
                createdAt: ele.createdAt,
                message: ele.message,
                sId: ele.sId,
                time: ele.time,
                updatedAt: ele.updatedAt,
                users: ele.users);
          })
          .toList()
          .cast<MessageHive>();
      var mBox = Hive.box("messages");
      mBox.clear();
      mBox.addAll(_messBox);
    } catch (e) {
      print(e);
      _utilsService.showErrorSnackBar(
          msg: e.toString(), title: "Messages fetching failed");
    }
    notifyListeners();
  }
}
