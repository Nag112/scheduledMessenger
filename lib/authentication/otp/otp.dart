import 'package:flutter/material.dart';
import 'package:messenger/_components/customButton.dart';
import 'package:messenger/constants.dart';
import 'package:stacked/stacked.dart';
import 'otpViewModel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
class OTPScreen extends StatelessWidget {
  Color get kPrimaryDarkColor => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<OTPViewModel>.reactive(
      viewModelBuilder: () => OTPViewModel(),
      builder: (context, model, _) {
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
                   PinInputTextField(
                                enabled: model.enableOtp,
                                onChanged: model.onEnter,
                                autoFocus: true,
                                cursor:
                                    Cursor(color: kPrimaryColor, enabled: true),
                                decoration: UnderlineDecoration(
                                  colorBuilder: PinListenColorBuilder(
                                      kPrimaryDarkColor, kPrimaryColor),
                                ),
                                pinLength: 5,
                                keyboardType: TextInputType.number,
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
