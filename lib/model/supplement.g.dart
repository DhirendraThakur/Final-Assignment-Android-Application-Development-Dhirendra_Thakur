// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Supplement _$SupplementFromJson(Map<String, dynamic> json) => Supplement(
      supplementname: json['supplementname'] as String?,
      supplementrate: json['supplementrate'] as String?,
      supplementtype: json['supplementtype'] as String?,
      supimage: json['supimage'] as String?,
    )..id = json['_id'] as String?;

Map<String, dynamic> _$SupplementToJson(Supplement instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'supplementname': instance.supplementname,
      'supplementrate': instance.supplementrate,
      'supplementtype': instance.supplementtype,
      'supimage': instance.supimage,
    };
