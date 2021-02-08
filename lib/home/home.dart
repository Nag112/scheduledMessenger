import 'package:flutter/material.dart';
import 'package:messenger/_components/customLoadingList.dart';
import 'package:stacked/stacked.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'homeViewModel.dart';
import 'package:date_format/date_format.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.fetchMessages(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Message History"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: model.profilePage,
              )
            ],
          ),
          body: SmartRefresher(
            enablePullDown: true,
            controller: model.refreshController,
            header: ClassicHeader(),
            onRefresh: model.onRefresh,
            child: model.messages.length == 0
                ? Center(
                    child: Image.asset('assets/images/nodata.gif'),
                  )
                : ListView.builder(
                    itemCount: model.messages.length,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    itemBuilder: (context, index) {
                      List<String> format = [
                        hh,
                        ':',
                        nn,
                        '',
                        am,
                        '  ',
                        dd,
                        '-',
                        M
                      ];
                      DateTime time = DateTime.fromMillisecondsSinceEpoch(
                          model.messages[index].time);
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black, width: 0.5))),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: DateTime.now().isBefore(time)
                              ? UpComing()
                              : Sent(),
                          title: Text(
                            model.messages[index].message,
                            // textAlign: TextAlign.justify,
                          ),
                          trailing:  MoreMenu(
                                  onSelect: (val) =>
                                      model.onMessageOption(val, index),
                                ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(formatDate(time, format)),
                              Text(
                                  "Sent to ${model.messages[index].users.length} users")
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          floatingActionButton: model.isAdmin
              ? FloatingActionButton(
                  onPressed: model.addMessage,
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

class UpComing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60), color: Colors.red),
      width: 60,
      height: 60,
      child: Text(
        "Up Coming",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class Sent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60), color: Colors.blueGrey),
      width: 60,
      height: 60,
      child: Center(
        child: Text(
          "Sent",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MoreMenu extends StatelessWidget {
  final Function onSelect;
  MoreMenu({this.onSelect});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: EdgeInsets.zero,
        onSelected: onSelect,
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                        child: Icon(Icons.edit),
                      ),
                      Text('Edit')
                    ],
                  )),
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                        child: Icon(Icons.delete),
                      ),
                      Text('Delete')
                    ],
                  )),
            ]);
  }
}
