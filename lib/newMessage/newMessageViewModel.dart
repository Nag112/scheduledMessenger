import 'package:flutter/material.dart';
import 'package:messenger/_models/message.dart';
import 'package:messenger/_services/apiService.dart';
import 'package:messenger/_services/messagesService.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:messenger/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NewMessageViewModel extends BaseViewModel {
  int dateTime = DateTime.now().millisecondsSinceEpoch;
  UtilsService _utils = locator<UtilsService>();
  ApiService _api = locator<ApiService>();
  MessagesService _messagesService = locator<MessagesService>();
  NavigationService _nav = locator<NavigationService>();
  bool _isBusy = true;
  bool get isBusy => _isBusy;
  List<Map> users = [];
  List<String> selectedUsers = [];
  String message;

  onMessage(val) {
    message = val;
  }

  selectUser(val, ind) {
    selectedUsers.remove(users[ind]['_id']);
    if (val) {
      selectedUsers.add(users[ind]['_id']);
    }
    notifyListeners();
  }

  onStart(args) async {
    if (args != null) {
      Message msg = args['msg'];
      selectedUsers = msg.users.cast<String>();
      dateTime = msg.time;
      message = msg.message;
    }
    var resp = await _api.getAllUsers();
    print(resp);
    users = List<Map>.from(resp['data']);
    _isBusy = false;
    notifyListeners();
  }

  newMessage() {
    if (selectedUsers.length > 0) {
      if (message != null && message != "") {
        bool err = DateTime.now()
            .isAfter(DateTime.fromMillisecondsSinceEpoch(dateTime));
        if (err) {
          _utils.showToast(
              msg: "Invalid time, Please select a time in the future");
        } else {
          _api.newMessage({
            "time": dateTime,
            "message": message,
            "users": selectedUsers
          }).then((resp) {
            _nav.navigateTo(Routes.homeScreen);
            if (resp['success']) {
              _messagesService.fetchMessages();
            }
          });
        }
      } else {
        _utils.showToast(msg: "Message cannot be empty");
      }
    } else {
      _utils.showToast(msg: "Select atleast one user to send message");
    }
  }

  pickDate(context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    TimeOfDay _time;
    if (picked != null) {
      _time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (_time != null) {
        int tempSecs = (_time.hour * 3600 + _time.minute * 60) * 1000;
        dateTime = picked.millisecondsSinceEpoch + tempSecs;
        notifyListeners();
      }
    }
  }
}
