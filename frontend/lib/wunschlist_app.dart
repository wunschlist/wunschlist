import 'package:flutter/material.dart';
import 'navigation.dart';

class WunschlistApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationWidget()
    );
  }
}
