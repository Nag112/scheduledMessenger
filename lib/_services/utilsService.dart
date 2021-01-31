import 'package:messenger/locator.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

enum SnackbarType { greenAndRed, redAndWhite }

@lazySingleton
class UtilsService {
  final SnackbarService _snackBar = locator<SnackbarService>();
  UtilsService() {
    setupSnackbarUi();
    print("helllo");
  }
  showErrorSnackBar({title, msg}) {
    _snackBar.showCustomSnackBar(
      variant: SnackbarType.redAndWhite,
      message: msg,
      title: title,
      duration: Duration(seconds: 5),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => {},
    );
  }
  showSnackBar({title, msg})
  {
 _snackBar.showSnackbar(
      message: msg,
      title: title,
      duration: Duration(seconds: 5),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => {},
    );
  }

  void setupSnackbarUi() {
    final service = locator<SnackbarService>();
    // Registers a config to be used when calling showSnackbar
    service.registerSnackbarConfig(
      SnackbarConfig(
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        borderRadius: 0,
        margin: EdgeInsets.zero,
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
    service.registerCustomSnackbarConfig(
      variant: SnackbarType.redAndWhite,
      config: SnackbarConfig(
        backgroundColor: Colors.red,
        titleColor: Colors.white,
        messageColor: Colors.white,
        borderRadius: 1,
      ),
    );
  }
}
