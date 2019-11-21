import 'package:flutter/material.dart';
import 'wunschliste/wunschliste.dart';

// Our navigation widget which handles navigation between different screens.
class NavigationWidget extends StatefulWidget {
  @override
  _NavigationWidgetState createState() => new _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    WunschlisteWidget(),
    Text(
      "Temporärer Settings Placeholder",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wunschlist"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text("Wunschlist")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Settings"))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
