import 'package:flutter/material.dart';
import 'package:wunschlist/my_app_bar.dart';
import 'package:wunschlist/model/wunsch.dart';

class WunschDetailWidget extends StatefulWidget {
  @override
  _WunschDetailWidgetState createState() => new _WunschDetailWidgetState();
}

class _WunschDetailWidgetState extends State<WunschDetailWidget> {

  @override
  Widget build(BuildContext context) {
    final Wunsch wunsch = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
        appBar: MyAppBar(title: wunsch.title), body: Center(child: Text("Detail")));
  }
}
