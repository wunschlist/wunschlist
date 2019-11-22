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
            final wunsch = wunschlistModel.wunschlist[index];
            return Dismissible(
              key: Key(wunsch.title),
              onDismissed: (direction) {
                Provider.of<WunschlistModel>(context, listen: false)
                    .remove(wunschlistModel.wunschlist[index]);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wunsch.title + " removed"),
                  ),
                );
              },
              background: Container(color: Colors.red),
              child: Container(
                color: Colors.orange[((index % 10) + 1) * 100],
                child: ListTile(
                  title: Text(wunsch.title),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
