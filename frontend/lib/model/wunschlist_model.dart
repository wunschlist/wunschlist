import 'package:flutter/foundation.dart';
import 'package:wunschlist/model/wunsch.dart';

class WunschlistModel extends ChangeNotifier {
  // this is our internal representation of the wunschlist
  final List<Wunsch> _wunschlist = [];

  List<Wunsch> get wunschlist => List.unmodifiable(_wunschlist);

  void add(Wunsch wunsch) {
    _wunschlist.add(wunsch);
    notifyListeners();
  }

}