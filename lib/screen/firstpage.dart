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
      
      appBar: AppBar(title: Text('Fitness Management'),),
      
      body: Center(
        child: 
        
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, "second");
          
        }, child: const Text("Next Page"),),
      
      )
      
      
    );
  }
}