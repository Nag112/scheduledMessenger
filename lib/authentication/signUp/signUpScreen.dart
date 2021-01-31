import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:messenger/authentication/signUp/signUpViewModel.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, _) {
        return Scaffold();
      },
    );
  }
}
