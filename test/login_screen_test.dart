import 'package:fitness/screen/login.dart';
import 'package:fitness/screen/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:octopus/main.dart';
// import 'package:octopus/ui/connect/views/connect_component.dart';
// import 'package:octopus/ui/widgets/buttons.dart';


void main() {
  testWidgets("Empty user name and password test",  (WidgetTester tester) async {
    await tester.pumpWidget(Scaffold(
        body: Login(),
    ));
    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsOneWidget);
  });

  testWidgets("Empty username but filled password test",  (WidgetTester tester) async {
    await tester.pumpWidget(Scaffold(
      body: Login(),
    ));
    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsOneWidget);
  });

  testWidgets("filled username and password test",  (WidgetTester tester) async {
    await tester.pumpWidget(Scaffold(
      body: Login(),
    ));
    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsOneWidget);
  });
}