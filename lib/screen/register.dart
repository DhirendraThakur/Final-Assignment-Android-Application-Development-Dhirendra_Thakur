import 'package:flutter/material.dart';
import 'package:fitness/model/user.dart';
import 'package:fitness/http/httpuser.dart';
import 'package:fitness/model/user.dart';
import 'package:motion_toast/motion_toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final regform = GlobalKey<FormState>();

  String username = '';
  String password = '';
  String phone = '';
  String address = '';

  Future<bool> registerUser(User u) {
    var res = HttpConnectUser().registerPost(u);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.blue,
              size: 30,
            ),
            onPressed: () {},
          ),
          title: const Text(
            'Registration',
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: regform,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) {
                    username = value!;
                  },
                  //  validator: (value){
                  //    if (value == null || value.isEmpty){return "Field canno be empty";}
                  //  },
                  decoration: InputDecoration(
                    
                    labelText: "Username",
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    fillColor: Colors.lime,
                    icon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  //      validator: (value){
                  //    if (value == null || value.isEmpty){return "Field canno be empty";}
                  //  },
                  decoration: InputDecoration(
                     border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Password",
                   // border: UnderlineInputBorder(),
                    icon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) {
                    phone = value!;
                  },
                  // validator: (value){
                  //        if (value == null || value.isEmpty){return "Field canno be empty";}
                  //      },
                  decoration: InputDecoration(
                    labelText: "Phone",
                     border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    icon: Icon(Icons.email),
                  ),
                ),
                 SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onSaved: (value) {
                    address = value!;
                  },
                  //      validator: (value){
                  //    if (value == null || value.isEmpty){return "Field canno be empty";}
                  //  },
                  decoration: InputDecoration(
                    labelText: "Address",
                     border:OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    icon: Icon(
                      Icons.lock,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(

                    style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,      
                      minimumSize: const Size(double.infinity, 50),
                      
                    ),
                    onPressed: () async {
                      if (regform.currentState!.validate()) {
                        regform.currentState!.save();
                        User u = User(
                          username: username,
                          password: password,
                          phone: phone,
                          address: address,
                        );
                        bool isCreated = await registerUser(u);
                        if (isCreated) {
                          //  Navigator.pushNamed(context, '/');
                          MotionToast.success(description: 'New user created')
                              .show(context);
                        } else {
                          MotionToast.error(
                                  description: 'Failed to create user')
                              .show(context);
                        }
                      }
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ));
  }
}
