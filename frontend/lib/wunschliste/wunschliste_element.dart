import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wunschlist/model/wunsch.dart';
import 'package:wunschlist/model/wunschlist_model.dart';

class WunschlisteElement extends StatelessWidget {
  WunschlisteElement(
      {@required this.wunsch,
      @required this.index,
      @required this.wunschlistModel})
      : assert(wunsch != null),
        assert(index != null),
        assert(wunschlistModel != null);

  final Wunsch wunsch;
  final int index;
  final WunschlistModel wunschlistModel;

  @override
  Widget build(BuildContext context) {
    Widget card = Card(
      margin: const EdgeInsets.all(20.0),
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.orange[((index % 10) + 1) * 100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            wunsch.title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );

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
      child: card,
    );
  }
}
