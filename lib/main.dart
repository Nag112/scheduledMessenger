import 'package:flutter/material.dart' hide Router;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import '_models/messageHive.dart';
import 'locator.dart';
import 'router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import '_models/userHive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..initFlutter()
    ..registerAdapter(UserHiveAdapter())
    ..registerAdapter(
        MessageHiveAdapter()); //hive must be intitalised before locator as message server uses hive in constructor and message servicve is called in fcm service
  setupLocator();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      title: 'Messenger',
      onGenerateRoute: Router(),
      theme: ThemeData(
        fontFamily: 'Muli',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
