import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:provider/provider.dart';
import 'model/wunschlist_model.dart';

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
      home: ChangeNotifierProvider(
        builder: (context) => WunschlistModel(),
        child: NavigationWidget())
    );
  }
}
