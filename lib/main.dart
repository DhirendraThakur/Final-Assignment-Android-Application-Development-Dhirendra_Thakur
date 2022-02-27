import 'package:fitness/screen/dashboard.dart';
import 'package:fitness/screen/displayproduct.dart';
import 'package:fitness/screen/displaysupplement.dart';
import 'package:fitness/screen/firstpage.dart';
import 'package:fitness/screen/login.dart';
import 'package:fitness/screen/product.dart';
import 'package:fitness/screen/register.dart';
import 'package:fitness/screen/sensor.dart';
import 'package:fitness/screen/supplement_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/login': (context) => Login(),
        '/third': (context) => Dashboard(),
        '/register': (context) => RegisterScreen(),
        '/product/add': (context) => SupplementAdd(),
        "/product/show": (context) => DisplayProduct(),
        "/supplement/add": (context) => SuppleAdd(),
        "/supplement/show": (context) => DisplaySupplement(),
        "/sensor": (context) => Accelometor()
      },
      // home: RegisterScreen(),
      // home : Dashboard(),
    );
  }
}
