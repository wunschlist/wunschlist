import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:provider/provider.dart';
import 'model/wunschlist_model.dart';
import 'create_wunsch/create_wunsch.dart';
import 'create_wunsch/add_link_widget.dart';

// This file includes the basic sceleton of our app.
// It has its title and specifies the theme.
// Also it sets our navigation widget as the home screen.
class WunschlistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => WunschlistModel(),
      child: MaterialApp(
        title: 'Wunschlist',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => NavigationWidget(),
          "/create_wunsch": (context) => CreateWunschWidget(),
          "/add_link": (context) => AddLinkWidget()
        },
      ),
    );
  }
}
