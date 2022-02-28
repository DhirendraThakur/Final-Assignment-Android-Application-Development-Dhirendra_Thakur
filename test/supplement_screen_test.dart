import 'package:fitness/screen/login.dart';
import 'package:fitness/screen/product.dart';
import 'package:fitness/screen/supplement_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:octopus/main.dart';
// import 'package:octopus/ui/connect/views/connect_component.dart';
// import 'package:octopus/ui/widgets/buttons.dart';


void main() {
  testWidgets("Empty supplement detail Test",  (WidgetTester tester) async {
    await tester.pumpWidget(Scaffold(
      body: SuppleAdd(),
    ));
    var textFormField = find.byType(TextFormField);
    expect(textFormField, findsOneWidget);
  });
}