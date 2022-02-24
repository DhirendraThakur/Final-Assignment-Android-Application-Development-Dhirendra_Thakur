import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fitness/http/httpuser.dart';

import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:fitness/model/supplement.dart';

class httpSupplement{
final baseurl ='http://192.168.1.65:3500/api/v1';
  String mytoken = HttpConnectUser.token;

  Future<String> uploadImage (String filepath, String id) async{
  try{
    String route ='product/'+id +'/photo';
    String url = baseurl + route;
    var request = http.MultipartRequest('PUT', Uri.parse(url)); 

  //using the token in the headrs
  request.headers.addAll({
    'Authorization' : 'Bearer $mytoken',
  });
  //need a filename
  var ss = filepath.split('/').last;

  //adding the file in the request
  request.files.add(
    http.MultipartFile('file',
    File(filepath).readAsBytes().asStream(),
    File(filepath).lengthSync(),
    filename: ss,

    ),
  );
  var response = await request.send();
var responseString = await response.stream.bytesToString();
if (response.statusCode ==200){
  return responseString;
}
  }
  catch(err){
    log('$err');
  }
  return 'something went wrong';
}

void registerSupplement (Supplement supplement, File? filepath) async{

  Map<String, dynamic> supplementMap ={
    'supplementname' : supplement.supplementname,
    'supplementrate' : supplement.supplementrate,
    'supplementtype' : supplement.supplementtype,
   // 'productdesc' : product.productdesc,
  };
  String tok = 'Bearer $mytoken';
  try{
final response = await http
.post(Uri.parse(baseurl + 'product/'), body: supplementMap, headers: {
  'Authorization' : tok,
} );
if (response.statusCode ==200){
// uploading imgae after data inserted of product
if(filepath != null){
var jsonData = jsonDecode(response.body);
uploadImage(filepath.path, jsonData['data']['_id']);
}

Fluttertoast.showToast(msg: "Data upload Successfully");

}


  }
  catch(err){
    log('$err');
  }
}


}
