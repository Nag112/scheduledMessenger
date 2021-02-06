import 'package:flutter/material.dart';
import 'package:messenger/_components/customLoadingList.dart';
import 'package:stacked/stacked.dart';

import 'homeViewModel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Message History"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              )
            ],
          ),
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CustomLoadingList()),
          floatingActionButton: !model.isAdmin
              ? FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 32,
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
