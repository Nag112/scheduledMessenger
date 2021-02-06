import 'package:injectable/injectable.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:messenger/_services/userService.dart';
import 'package:messenger/locator.dart';

@lazySingleton
class FcmService {
  initService(context) {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    final pushNotificationService = PushNotificationService(_firebaseMessaging);
    pushNotificationService.initialise(context);
  }
}

class PushNotificationService {
  final FirebaseMessaging _fcm;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  PushNotificationService(this._fcm);
  // ignore: missing_return
  Future onSelectNotification(String payload) {
    print("Mahdi: onSelectNotification");
  }

  void showNotification(String title, String body) async {
    await _notification(title, body);
  }

  Future<void> _notification(String title, String body) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.max,
        playSound: true,
        // sound: 'sound',
        showProgress: true,
        priority: Priority.high,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin
        .show(0, title, body, platformChannelSpecifics, payload: 'test');
  }

  Future initialise(context) async {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
    String token = await _fcm.getToken();
    UserService _user = locator<UserService>();
    _user.deviceToken = token;
    FirebaseMessaging.onMessage.listen((message) {
      print(message);
    });
    // FirebaseMessaging.onBackgroundMessage((message))
  }
}
