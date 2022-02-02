//import 'package:fitness/http/http.dart';
import 'dart:convert';
import 'package:fitness/model/user.dart';
import 'package:fitness/response/response.dart';
import 'package:http/http.dart';

class HttpConnectUser{
  //String baseurl ='http://10.0.2.2:3000/api/v1';
  // String baseurl ='http:localhost:3000/api/v1';
  String baseurl ='http://ip-api.com/json';

  static String token ='';

  //sending data to the server-- creating user
  Future<bool>registerPost(User user)async{
    Map<String, dynamic>userMap = {
      "fname": user.fname,
      "lname": user.lname,
      "email": user.email,
      "password": user.password,
    };
    final response = 
    await post(Uri.parse(baseurl+ 'auth/register'), body: userMap);
   if(response.statusCode == 200){
    var userRes = ResponseUser.fromjson(jsonDecode(response.body));
    return userRes.success!;
  }
  else {
    return false;
  }
}

// sending data to the server= login as user

Future<bool> loginPosts (String email, String password) async {
  Map<String, dynamic> LoginUser ={

    'email': email,
    'password': password
  };
  try {
    final response = await post(
      Uri.parse(
        baseurl + "auth/login",

      ),
      body:  LoginUser
    );
    //kjson serializing inline
    final jsonData = jsonDecode(response.body) as Map;
    token = jsonData ['token'];

    if (token.isNotEmpty){
      return true;
    }

  }
  catch(e){
    print(e);
  }
  return false;
}

}

