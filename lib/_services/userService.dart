import 'package:injectable/injectable.dart';

@lazySingleton
class UserService {
  Map signupData = {};
  String deviceToken;
}
