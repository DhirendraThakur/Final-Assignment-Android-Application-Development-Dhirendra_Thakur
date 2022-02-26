// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      productname: json['productname'] as String?,
      producttype: json['producttype'] as String?,
      productprice: json['productprice'] as String?,
      pimage: json['pimage'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'productname': instance.productname,
      'producttype': instance.producttype,
      'productprice': instance.productprice,
      'pimage': instance.pimage,
    };
