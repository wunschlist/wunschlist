// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:wunschlist/wunschlist_app.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('BottomNavigationBar test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(WunschlistApp());

    // Verify that our bottom navigation bar shows the 2 navigation elements
    final RenderBox box = tester.renderObject(find.byType(BottomNavigationBar));

    // Verify bar has the correct size
    expect(box.size.height, kBottomNavigationBarHeight);

    // Verify correct options are shown in the bar
    expect(find.text('Wunschlist'), findsWidgets);
    expect(find.text('Settings'), findsOneWidget);
  });
}
