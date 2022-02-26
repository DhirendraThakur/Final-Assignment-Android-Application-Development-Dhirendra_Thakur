import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

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
