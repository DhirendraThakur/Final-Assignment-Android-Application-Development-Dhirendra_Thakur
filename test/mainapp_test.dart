import 'package:fitness/main.dart';
import 'package:fitness/screen/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets("My App test",  (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('Welcome'), findsOneWidget);
  });
}