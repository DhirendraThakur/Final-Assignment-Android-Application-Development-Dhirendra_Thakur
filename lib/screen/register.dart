import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final regform = GlobalKey<FormState>();

String fname='';
String lname='';
String email='';
String password='';
  // Future<bool>registerUser(User u){
  //   var res = HttpConnectUser().registerPost(u);
  //   return res;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration'),)
      
    );
  }
}