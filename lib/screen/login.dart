import 'package:fitness/http/httpuser.dart';
import 'package:flutter/material.dart';
//import 'package:form_field_validator/form_field_validator.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:http/http.dart';



class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formkey = GlobalKey<FormState>();
  final lgController = TextEditingController()..text ='Dhiren';
  final passContoller = TextEditingController()..text ='Dhiren';
  String email = '';
  String password = '';
  Future <bool> loginPost(String email, String password){
    var res = HttpConnectUser().loginPosts(email, password);
    return res;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        appBar: AppBar(title: const Text('Fitness')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/fi.jpg'),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: lgController,
                    onSaved: (value) {
                      email = value!;
                    },
                    validator: MultiValidator([
                      EmailValidator(errorText: 'invalid email'),
                      RequiredValidator(errorText: '* Required'),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    controller: passContoller,
                    onSaved: (value) {
                      password = value!;
                    },
                    validator: MultiValidator([
                      MaxLengthValidator(15,
                          errorText: 'should be less than 15 charactert'),
                      MinLengthValidator(6, errorText: 'should be at least 6'),
                      RequiredValidator(errorText: '* Required'),
                    ]),
                    obscureText: true,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Enter your Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     minimumSize:  const Size(double.infinity,50), 
                   ),
                   onPressed: () async {
                     _formkey.currentState!.save();
                     var res = await loginPost(email, password);
                     if (res){
                       Navigator.pushNamed(context, '/third');
                       MotionToast.success(description: 'Login Success!!!')
                       .show(context);
                     }
                     else{
                       MotionToast.success(description: 'Some things went wrong')
                       .show(context);
                     }

                   }, child: Text('Login')),


                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      _formkey.currentState!.reset();
                    },
                    child: const Text('clear'),
                  ),
                ],
              )),
        ));
  }
}
