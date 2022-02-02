import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';
@JsonSerializable()
class Product{
@JsonKey(name: "_id")
  String? id;
  String? productname;
  String? producttype;
  String? productrate;
  String? productdesc;
  String? photo;
  String? createAt;
  
Product({
  this.id,
  this.productname,
  this.producttype,
  this.productrate,
  this.productdesc,
  this.photo,
  this.createAt
});

factory Product.fromJson(Map<String,dynamic>json)=>
_$ProductFromJson(json);
Map <String, dynamic> toJson()=>_$ProductToJson(this);

}

