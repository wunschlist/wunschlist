import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:wunschlist/model/wunsch.dart';
import 'package:wunschlist/model/wunschlist_model.dart';
import 'package:wunschlist/wunsch_detail/wunsch_detail.dart';

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
    var dateFormat = new DateFormat("dd-MM-yyyy - HH:mm");
    String wunschCreated = dateFormat
        .format(new DateTime.fromMillisecondsSinceEpoch(wunsch.createdInMs));
    var textColor =
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? Theme.of(context).textTheme.title.color
            : Colors.black;

    Widget card = InkWell(
      onTap: () {
        //Navigator.pushNamed(context, "/wunsch_detail");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WunschDetailWidget(),
        settings: RouteSettings(arguments: wunsch)));
      },
      child: Card(
        margin: const EdgeInsets.all(20.0),
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.orange[((index % 10) + 1) * 100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              wunsch.title,
              style: Theme.of(context).textTheme.title.copyWith(
                    color: textColor,
                  ),
            ),
            subtitle: Text(wunschCreated,
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: textColor)),
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
