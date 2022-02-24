import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fitness/http/httpuser.dart';
import 'package:http/http.dart' as http;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:fitness/model/product.dart';

import '../response/getproduct_resp.dart';

class HttpProduct {
  final baseurl = 'http://192.168.1.65:3500/';
  String mytoken = HttpConnectUser.token;

  Future<String> uploadImage(String filepath, String id) async {
    try {
      String route = 'product/' + id + '/photo/upload';
      String url = baseurl + route;
      var request = http.MultipartRequest('PUT', Uri.parse(url));

      //using the token in the headrs
      request.headers.addAll({
        'Authorization': 'Bearer $mytoken',
      });

      //need a filename
      var ss = filepath.split('/').last;

      //adding the file in the request
      request.files.add(
        http.MultipartFile(
          'file',
          File(filepath).readAsBytes().asStream(),
          File(filepath).lengthSync(),
          filename: ss,
        ),
      );

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return responseString;
      }
    } catch (err) {
      log('$err');
    }
    return 'something went wrong';
  }

  void registerProduct(Product product, File? filepath) async {
    Map<String, dynamic> productMap = {
      'productname': product.productname,
      'productprice': product.productprice,
      'producttype': product.producttype,
    };
    String tok = 'Bearer $mytoken';
    try {
      final response = await http
          .post(Uri.parse(baseurl + 'product/add'), body: productMap, headers: {
        'Authorization': tok,
      });
      if (response.statusCode == 200) {
// uploading imgae after data inserted of product
        if (filepath != null) {
          var jsonData = jsonDecode(response.body);
          uploadImage(filepath.path, jsonData['data']['_id']);
        }

        Fluttertoast.showToast(msg: "Data upload Successfully");
      }
    } catch (err) {
      log('$err');
    }
  }

  Future<List<Product>>? getProducts() async {
    String token = 'Bearer $mytoken';
    try {
      final response =
          await http.get(Uri.parse(baseurl + 'product/all'), headers: {
        'Authorization': token,
      });
      print(response.statusCode);
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var products = ResponseGetProduct.fromJson(jsonDecode(response.body));
        return products.data;
      }
      return [];
    } catch (e) {
      log('Get Products: $e');
      return [];
    }
  }

  void updateProduct(product, id) async {
    Map<String, dynamic> productMap = {
      'pid' : id,
      'productname': product.productname,
      'productprice': product.productprice,
      'producttype': product.producttype,
    };
    String tok = 'Bearer $mytoken';
    try {
      final response = await http
          .put(Uri.parse(baseurl + 'product/update'), body: productMap, headers: {
        'Authorization': tok,
      });
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Data upload Successfully");
      }
    } catch (err) {
      log('$err');
    }
  }

  void deleteProduct(id) async{
    print(id);
    String tok = 'Bearer $mytoken';
    try {
      final response = await http
          .delete(Uri.parse(baseurl + 'product/delete/' + id), headers: {
        'Authorization': tok,
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Data deleted Successfully");
      }
    } catch (err) {
      log('Product Delete : $err');

    }

  }
}
