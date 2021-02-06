import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/locator.dart';

@lazySingleton
class ApiService {
  UtilsService _utils = locator<UtilsService>();
  static BaseOptions _options = new BaseOptions(
    baseUrl: "http://192.168.1.101:5001",
    responseType: ResponseType.json,
    connectTimeout: 6000,
    headers: {'x-key': "cfd95e5924e46c0015032a3434cd4266876d60d0"},
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
    if (result.statusCode == 200) {
      _utils.showToast(
          msg: result.data["message"].toString(), background: kPrimaryColor);
      return Map.from(result.data);
    } else {
      _utils.showToast(msg: result.data["message"].toString());
    }
    return null;
  }

  Future getMessages() async {
    Response result;
    try {
      result = await dio.get("/messages");
    } catch (e) {
      _showError(e);
      return null;
    }
    if (result.statusCode == 200) {
      _utils.showToast(
          msg: result.data["message"].toString(), background: kPrimaryColor);
      return Map.from(result.data);
    } else {
      _utils.showToast(msg: result.data["message"].toString());
    }
    return null;
  }

  Future newMessage(data) async {
    Response result;
    try {
      result = await dio.post("/messages", data: data);
    } catch (e) {
      _showError(e);
      return null;
    }
    if (result.statusCode == 200) {
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
    if (result.statusCode == 200) {
      _utils.showToast(
          msg: result.data["message"].toString(), background: kPrimaryColor);
      return Map.from(result.data);
    } else {
      _utils.showToast(msg: result.data["message"].toString());
    }
    return null;
  }

  Future updateVerify(data) async {
    Response result;
    try {
      result = await dio.post("/user/verify", data: data);
    } catch (e) {
      _showError(e);
      return null;
    }
    if (result.statusCode == 200) {
      _utils.showToast(
          msg: result.data["message"].toString(), background: kPrimaryColor);
      return Map.from(result.data);
    } else {
      _utils.showToast(msg: result.data["message"].toString());
    }
    return null;
  }

  _showError(DioError e) {
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
    try {
      _utils.showErrorSnackBar(
          title: "Server error", msg: e.response.data['message']);
    } catch (err) {
      _utils.showErrorSnackBar(
          title: "Server error", msg: e.message);
    }
  }
}
