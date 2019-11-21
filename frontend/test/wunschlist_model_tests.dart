import 'package:flutter_test/flutter_test.dart';
import 'package:wunschlist/model/wunschlist_model.dart';
import 'package:wunschlist/model/wunsch.dart';

void main() {
  testWidgets("Test empty list initialization", (WidgetTester tester) async {
    final wunschlistModel = WunschlistModel();

    expect(wunschlistModel.wunschlist.length, equals(0));
  });

  testWidgets("Adding wish to list increases count", (WidgetTester tester) async {
    final wunschlistModel = WunschlistModel();

    wunschlistModel.addListener(() {
      expect(wunschlistModel.wunschlist.length, equals(1));
    });
    wunschlistModel.add(Wunsch(title: "Test"));
  });
}