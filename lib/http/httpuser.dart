import 'dart:convert';
import 'package:fitness/model/user.dart';
import 'package:fitness/response/response.dart';
import 'package:http/http.dart' as http;

class HttpConnectUser {
  String baseurl = 'http://192.168.1.65:3500/';

  // String baseurl ='http:localhost:3000/api/v1';
  //String baseurl ='http://jsonplaceholder.typicode.com/api/v1';
  //String baseurl ='http:/localhost:3000/api/v1/';
//  String baseurl = 'localhost:3000/api/v1/';

  static String token = '';

  //sending data to the server-- creating user
  Future<bool> registerPost(User user) async {
    Map<String, dynamic> userMap = {
      "username": user.username,
      "password": user.password,
      "address": user.address,
      "phone": user.phone,
    };
    final response = await http.post(Uri.parse(baseurl + 'customer/register'),
        body: userMap);
    if (response.statusCode == 200) {
      final userRes = jsonDecode(response.body);
      return userRes['success'];
    } else {
      return false;
    }
  }

// sending data to the server= login as user

  Future<bool> loginPosts(String username, String password) async {
    try {
      final response = await http.post(Uri.parse(baseurl + "customer/login"),
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8"
          },
          body: jsonEncode(
              <String, String>{"username": username, "password": password}));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        token = jsonData['token'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
