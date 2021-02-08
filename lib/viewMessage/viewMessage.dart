import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'viewMessageViewModel.dart';

class ViewMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    return ViewModelBuilder<ViewMessageViewModel>.reactive(
      onModelReady: (model)=>model.fetchMessage(args['id']),
      viewModelBuilder: () => ViewMessageViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
