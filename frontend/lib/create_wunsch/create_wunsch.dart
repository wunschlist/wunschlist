import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wunschlist/model/wunschlist_model.dart';
import 'package:wunschlist/model/wunsch.dart';
import 'add_link_widget.dart';
import 'package:wunschlist/my_app_bar.dart';
import 'package:intl/intl.dart';

class CreateWunschWidget extends StatefulWidget {
  @override
  _CreateWunschWidgetState createState() => new _CreateWunschWidgetState();
}

class _CreateWunschWidgetState extends State<CreateWunschWidget> {
  TextEditingController _titleController = TextEditingController();
  String _selectedLink;

  void _onFabTapped(BuildContext scaffoldContext) {
    if (_titleController.text.isEmpty) {
      Scaffold.of(scaffoldContext).showSnackBar(
        SnackBar(
          content: Text(
            "Please enter a title first!",
          ),
        ),
      );
      return;
    }
    Provider.of<WunschlistModel>(context, listen: false).add(Wunsch(
        title: _titleController.text,
        link: _selectedLink,
        createdInMs: DateTime.now().millisecondsSinceEpoch));
    Navigator.pop(context);
  }

  void _grabLink() async {
    String link = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddLinkWidget()));
    _selectedLink = link;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar(
        title: "Create Wunsch",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _titleController,
              decoration:
                  InputDecoration(hintText: "Enter title", labelText: "Title"),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: RaisedButton(
              onPressed: _grabLink,
              child: Text(
                "Add Link",
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 40.0),
        child: Builder(
          builder: (scaffoldContext) {
            return FloatingActionButton(
              onPressed: () => _onFabTapped(scaffoldContext),
              child: Icon(Icons.check),
            );
          },
        ),
      ),
    );
  }
}
