import 'package:fitness/screen/firstpage.dart';
import 'package:fitness/screen/login.dart';
import 'package:flutter/material.dart';
void  main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=> MainScreen(),
        'second': (context)=> Login(),
       
      },
      );
  }
}