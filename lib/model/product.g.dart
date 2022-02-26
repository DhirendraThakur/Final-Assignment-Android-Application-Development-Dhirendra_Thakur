// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      productname: json['productname'] as String?,
      producttype: json['producttype'] as String?,
      productrate: json['productrate'] as String?,
     // productdesc: json['productdesc'] as String?,
      photo: json['photo'] as String?,
      createAt: json['createAt'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'productname': instance.productname,
      'producttype': instance.producttype,
      'productrate': instance.productrate,
    //  'productdesc': instance.productdesc,
      'photo': instance.photo,
      'createAt': instance.createAt,
    };
