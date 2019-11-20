import 'package:flutter/material.dart';
import 'navigation.dart';

// This file includes the basic sceleton of our app.
// It has its title and specifies the theme.
// Also it sets our navigation widget as the home screen.
class WunschlistApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wunschlist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationWidget()
    );
  }
}
