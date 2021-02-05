import 'package:flutter/material.dart';
import 'package:messenger/_components/customButton.dart';
import 'package:messenger/constants.dart';
import 'signUpViewModel.dart';
import 'package:messenger/_components/customInputFields.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.05),
                    Image.asset(
                      'assets/icons/ic_launcher.png',
                      height: size.height * 0.1,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor,
                        fontSize: size.width * 0.10,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    RoundedInputField(
                      labelText: "User Name",
                      onChanged: (val) => model.onText(val, 'username'),
                    ),
                    SizedBox(height: 5),
                    RoundedInputField(
                      labelText: "Your Mobile",
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => model.onText(val, 'mobile'),
                    ),
                    SizedBox(height: 5),
                    RoundedPasswordField(
                      labelText: "Password",
                      onChanged: (val) => model.onText(val, 'pass'),
                    ),
                    SizedBox(height: 5),
                    RoundedPasswordField(
                      labelText: "Confirm Password",
                      hintText: "Enter your password again",
                      onChanged: (val) => model.onText(val, 'cpass'),
                    ),
                    SizedBox(height: 25),
                    RoundedButton(
                        text: "SIGN UP", width: 0.9, onPress: model.onSubmit),
                    SizedBox(height: size.height * 0.05),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      onPress: model.signin,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
