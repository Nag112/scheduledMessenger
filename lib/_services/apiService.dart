import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/locator.dart';

@lazySingleton
class ApiService {
  UtilsService _utils = locator<UtilsService>();
  static BaseOptions _options = new BaseOptions(
    baseUrl: "http://10.0.2.2:5001",
    responseType: ResponseType.json,
    connectTimeout: 6000,
    receiveTimeout: 8000,
  );
  Dio dio = new Dio(_options);
  Future signUp(data) async {
    Response result;
    try {
      result = await dio.post("/user/register", data: data);
    } catch (e) {
      _showError(e);
      return null;
    }
    if (result.statusCode == 200 && result.data['status']) {
      _utils.showToast(
          msg: result.data["message"].toString(), background: kPrimaryColor);
      return Map.from(result.data);
    } else {
      _utils.showToast(msg: result.data["message"].toString());
    }
    return null;
  }

  Future login(data) async {
    Response result;
    try {
      result = await dio.post("/user/login", data: data);
    } catch (e) {
      _showError(e);
      return null;
    }
    if (result.statusCode == 200 && result.data['status']) {
      _utils.showToast(
          msg: result.data["message"].toString(), background: kPrimaryColor);
      return Map.from(result.data);
    } else {
      _utils.showToast(msg: result.data["message"].toString());
    }
    return null;
  }

  _showError(dynamic e) {
    if (e.type == DioErrorType.DEFAULT &&
        e.message.contains('SocketException') &&
        e.message.contains('Network is unreachable')) {
      _utils.showErrorSnackBar(
          msg: 'Please connect to Internet for better experience',
          title: "No Internet");
      return;
    } else if (DioErrorType.RECEIVE_TIMEOUT == e.type ||
        DioErrorType.CONNECT_TIMEOUT == e.type) {
      _utils.showErrorSnackBar(
          title: "Seems to be Slow Internet",
          msg: "Please connect to Internet for better experience");
      return;
    }

    _utils.showErrorSnackBar(
        title: "Server error",
        msg: "Something went wrong. Please try again later");
  }
}
