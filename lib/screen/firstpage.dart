import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Color(0xfffdfdfdf),
      
      appBar: AppBar(title: Text('Fitness Management'),),
      
      body: SafeArea(child: SingleChildScrollView(
padding:  EdgeInsets.all(25.0),
        child: Form(child: Column(

          children: [
        const    SizedBox( height: 50,),
           InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/register');
          },
  child:  RichText( text: TextSpan(children: [
    TextSpan( text: '',
    style:  TextStyle(fontSize: 20, color: Colors.blue),
    ),

    TextSpan(
      text: 'Sign Up!!!', style: TextStyle(
        fontSize: 30, color: Colors.red,
      )
    )
  ]))

          ),


SizedBox(height: 50,),
   InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
  child:  RichText( text: TextSpan(children: [
    TextSpan( text: 'LOGIN',
    style:  TextStyle(fontSize: 20, color: Colors.blueAccent),
    ),

    TextSpan(
      text: '', style: TextStyle(
        fontSize: 30, color: Colors.purple,
      )
    )
  ]))




          ),

          ],
        ),)
        
      
          
      ))
      
    );
  }
}