import 'package:flutter/material.dart';
import 'package:wunschlist/model/wunschlist_model.dart';
import 'package:provider/provider.dart';

class WunschlisteWidget extends StatefulWidget {
  @override
  _WunschlisteWidgetState createState() => new _WunschlisteWidgetState();
}

class _WunschlisteWidgetState extends State<WunschlisteWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child:
          Consumer<WunschlistModel>(builder: (context, wunschlistModel, child) {
        return ListView.builder(
          itemCount: wunschlistModel.wunschlist.length,
          itemBuilder: (context, index) {
            var wunsch = wunschlistModel.wunschlist[index];
            return ListTile(title: Text(wunsch.title));
          },
        );
      }),
    );
  }
}
