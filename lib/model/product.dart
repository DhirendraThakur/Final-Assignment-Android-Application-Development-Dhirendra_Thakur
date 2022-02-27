//import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

const String tableProduct = 'products';

class ProductFields {
  static const String id = 'id';
  static const String objectid = '_id';
  static const String productname = 'productname';
  static const String producttype = 'product';
  static const String productprice = 'productprice';
  static const String pimage = 'pimage';
}

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  String? id;
  String? productname;
  String? producttype;
  String? productprice;
  String? pimage;

  Product({
    this.id,
    this.productname,
    this.producttype,
    this.productprice,
    this.pimage,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
