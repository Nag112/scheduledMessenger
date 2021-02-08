import 'package:flutter/material.dart';
import 'package:messenger/_components/customLoadingList.dart';
import 'package:messenger/constants.dart';

import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'newMessageViewModel.dart';
import 'package:date_format/date_format.dart';

class NewMessageScreen extends StatelessWidget {
  String dateFormat(int mSecs) {
    var date = DateTime.fromMillisecondsSinceEpoch(mSecs);
    return formatDate(date, [d, ' ', M, ' \'', yy]);
  }

  String timeFormat(int mSecs) {
    var date = DateTime.fromMillisecondsSinceEpoch(mSecs);
    return formatDate(date, [hh, ':', nn, ' ', am]);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewMessageViewModel>.reactive(
      onModelReady: (model) => model.onStart(),
      viewModelBuilder: () => NewMessageViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Compose"),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter the message"),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: TextFormField(
                        onChanged: model.onMessage,
                        cursorColor: Colors.black,
                        maxLength: 250,
                        maxLines: 6,
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Pick the time"),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: GestureDetector(
                                onTap: () => model.pickDate(context),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/clock.svg',
                                      height: 30,
                                    ),
                                    Text(
                                      dateFormat(model.dateTime),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      timeFormat(model.dateTime),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text("No. Of Users Selected"),
                              Text(model.selectedUsers.length.toString()),
                              RaisedButton(
                                color: kPrimaryColor,
                                onPressed: model.newMessage,
                                child: Text(
                                  "Schedule",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Pick Users to send message: "),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        height: double.maxFinite,
                        child: model.isBusy
                            ? CustomLoadingList()
                            : Column(
                                children:
                                    List.generate(model.users.length, (index) {
                                  return ContactTile(
                                    data: model.users[index],
                                    value: model.selectedUsers
                                        .contains(model.users[index]['_id']),
                                    onChanged: (val) =>
                                        model.selectUser(val, index),
                                  );
                                }),
                              ))
                  ]),
            ),
          ),
        );
      },
    );
  }
}

class ContactTile extends StatelessWidget {
  final Function onChanged;
  final bool value;
  final data;
  const ContactTile({Key key, this.data, this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      title: Text(data["name"]),
      subtitle: Text(data["mobile"]),
      onChanged: onChanged,
    );
  }
}
