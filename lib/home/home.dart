import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'homeViewModel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) {
        return Scaffold();
      },
    );
  }
}
