import 'package:flutter/material.dart';

class WunschlisteWidget extends StatefulWidget {
  @override
  _WunschlisteWidgetState createState() => new _WunschlisteWidgetState();
}

class _WunschlisteWidgetState extends State<WunschlisteWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: Text("Hier steht die Liste mit Wünschen"),
      ),
    );
  }
}