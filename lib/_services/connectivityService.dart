import 'package:messenger/_services/utilsService.dart';
import 'package:messenger/locator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

enum SnackbarType { greenAndRed, redAndWhite }

@lazySingleton
class ConnectivityService {
  UtilsService _utils = locator<UtilsService>();
  ConnectivityService() {
    print('called cone');
    Connectivity _connect = new Connectivity();
    _connect.checkConnectivity().then((res) {
      if (res == ConnectivityResult.none) {
        _utils.showErrorSnackBar(
            msg: 'Please connect to Internet for better experience',
            title: "No Internet");
      }
    }).catchError((e) {
      print("error from check connection ${e.toString()}");
    });
    _connect.onConnectivityChanged.listen((res) async {
      if (ConnectivityResult.none == res) {
        _connect.checkConnectivity().then((res) {
          if (res == ConnectivityResult.none) {
            _utils.showSnackBar(
                title: "No internet",
                msg: "Something went wrong. Please try again later");
          }
        });
      }
    });
  }
}
