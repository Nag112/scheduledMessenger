import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'otpViewModel.dart';


class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OTPViewModel>.reactive(
      viewModelBuilder: () => OTPViewModel(),
      builder: (context, model, _) {
        return Scaffold();
      },
    );
  }
}
