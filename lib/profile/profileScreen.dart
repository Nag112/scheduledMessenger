import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:messenger/profile/profileViewModel.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, _) {
        return Scaffold();
      },
    );
  }
}
