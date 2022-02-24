import 'package:json_annotation/json_annotation.dart';

part'supplement.g.dart';
@JsonSerializable()
class Supplement{
@JsonKey(name: "_id")
String? id;
String? supplementname;
String? supplementrate;
String? supplementtype;
String? supimage;

Supplement({
  this.supplementname,
  this.supplementrate,
  this.supplementtype,
  this.supimage
});

factory Supplement.fromJson(Map<String,dynamic>json)=>
_$SupplementFromJson(json);
Map <String, dynamic> toJson()=>_$SupplementToJson(this);



}