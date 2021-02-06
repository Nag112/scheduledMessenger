import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'viewMessageViewModel.dart';

class ViewMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ViewMessageViewModel>.reactive(
      viewModelBuilder: () => ViewMessageViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
