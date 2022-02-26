// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getsupplement_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetSupplement _$ResponseGetSupplementFromJson(
        Map<String, dynamic> json) =>
    ResponseGetSupplement(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Supplement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetSupplementToJson(
        ResponseGetSupplement instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
