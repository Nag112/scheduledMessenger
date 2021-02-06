import 'package:flutter/material.dart';
import 'package:messenger/_components/customButton.dart';
import 'package:messenger/constants.dart';
import 'package:messenger/_components/customInputFields.dart';
import 'package:stacked/stacked.dart';

import 'forgotPasswordViewModel.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<ForgotPasswordViewModel>.reactive(
        viewModelBuilder: () => ForgotPasswordViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.15),
                    Image.asset(
                      'assets/icons/ic_launcher.png',
                      height: size.height * 0.1,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor,
                        fontSize: size.width * 0.10,
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),
                    RoundedInputField(
                      labelText: "Your Mobile",
                      keyboardType: TextInputType.phone,
                      onChanged: model.onMobile,
                    ),
                    SizedBox(height: 5),
                    SizedBox(height: 25),
                    RoundedButton(
                        text: "Verify", width: 0.9, onPress: model.onSubmit),
                    SizedBox(height: size.height * 0.03),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
