import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'newMessageViewModel.dart';

class NewMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewMessageViewModel>.reactive(
      viewModelBuilder: () => NewMessageViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
