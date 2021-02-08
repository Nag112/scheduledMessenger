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
  setupLocator();
  await Firebase.initializeApp();
  Hive
    ..initFlutter()
    ..registerAdapter(UserHiveAdapter())
  ..registerAdapter(MessageHiveAdapter());
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
