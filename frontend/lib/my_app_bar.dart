import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key key, @required this.title})
      : assert(title != null),
        super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: Theme.of(context).textTheme.title, textAlign: TextAlign.start),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
