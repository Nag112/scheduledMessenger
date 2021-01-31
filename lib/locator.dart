import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'locator.config.dart';

enum SnackbarType { greenAndRed, redAndWhite }
final locator = GetIt.instance;
@InjectableInit()
void setupLocator() {
  $initGetIt(locator);
  setupSnackbarUi();
  Connectivity _connect = new Connectivity();
  SnackbarService _snackBar = locator<SnackbarService>();
  _connect.checkConnectivity().then((res) {
    if (ConnectivityResult.none == res) {
      _snackBar.showCustomSnackBar(
        variant: SnackbarType.redAndWhite,
        message: 'Please connect to Internet for better experience',
        title: 'No Internet Connection detected',
        duration: Duration(seconds: 5),
        onTap: (_) {
          print('snackbar tapped');
        },
        mainButtonTitle: 'Close',
        onMainButtonTapped: () => {},
      );
    }
  });
  _connect.onConnectivityChanged.listen((res) {
    if (ConnectivityResult.none == res) {
      print("no internet");
      _snackBar.showCustomSnackBar(
        variant: SnackbarType.redAndWhite,
        message: 'Please connect to Internet for better experience',
        title: 'No Internet Connection detected',
        duration: Duration(seconds: 5),
        onTap: (_) {
          print('snackbar tapped');
        },
        mainButtonTitle: 'Undo',
        onMainButtonTapped: () => print('Undo the action!'),
      );
    }
  });
}

void setupSnackbarUi() {
  final service = locator<SnackbarService>();
  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.redAndWhite,
    config: SnackbarConfig(
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      borderRadius: 1,
    ),
  );
  service.registerCustomSnackbarConfig(
    variant: SnackbarType.greenAndRed,
    config: SnackbarConfig(
      backgroundColor: Colors.white,
      titleColor: Colors.green,
      messageColor: Colors.red,
      borderRadius: 1,
    ),
  );
}
