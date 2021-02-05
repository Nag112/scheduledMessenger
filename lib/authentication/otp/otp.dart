import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:messenger/_components/customButton.dart';
import 'package:messenger/constants.dart';
import 'package:stacked/stacked.dart';
import 'otpViewModel.dart';
import 'package:velocity_x/velocity_x.dart';

class OTPScreen extends StatelessWidget {
  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<OTPViewModel>.reactive(
      viewModelBuilder: () => OTPViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(25),
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
                    "OTP",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                      fontSize: size.width * 0.10,
                    ),
                  ),
                  SizedBox(height: 25),
                  "Please enter the otp recieved".text.make(),
                  SizedBox(height: size.height * 0.08),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: PinPut(
                      fieldsCount: 6,
                      onSubmit: model.onEnter,
                      focusNode: model.pinPutFocusNode,
                      controller: model.otpController,
                      submittedFieldDecoration: pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      selectedFieldDecoration: pinPutDecoration,
                      followingFieldDecoration: pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.deepPurpleAccent.withOpacity(.5),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: "resend otp".text.color(kPrimaryColor).make(),
                      onPressed: model.resend,
                    ),
                  ),
                  SizedBox(height: 25),
                  RoundedButton(
                      text: "Submit", width: 0.9, onPress: model.onSubmit),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
