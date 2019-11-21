import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wunschlist/model/wunschlist_model.dart';
import 'package:wunschlist/model/wunsch.dart';

class CreateWunschWidget extends StatefulWidget {
  @override
  _CreateWunschWidgetState createState() => new _CreateWunschWidgetState();
}

class _CreateWunschWidgetState extends State<CreateWunschWidget> {
  TextEditingController titleController = TextEditingController();

  void _onFabTapped(BuildContext scaffoldContext) {
    if (titleController.text.isEmpty) {
      Scaffold.of(scaffoldContext).showSnackBar(
        SnackBar(
          content: Text(
            "Please enter a title first!",
          ),
        ),
      );
      return;
    }
    Provider.of<WunschlistModel>(context, listen: false)
        .add(Wunsch(title: titleController.text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Create Wunsch"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: titleController,
              decoration:
                  InputDecoration(hintText: "Enter title", labelText: "Title"),
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 40.0),
        child: Builder(
          builder: (scaffoldContext) {
            return FloatingActionButton(
              onPressed: () {
                _onFabTapped(scaffoldContext);
              },
              child: Icon(Icons.check),
            );
          },
        ),
      ),
    );
  }
}
