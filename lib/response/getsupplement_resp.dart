import 'package:json_annotation/json_annotation.dart';

import 'package:fitness/model/supplement.dart';

part 'getsupplement_resp.g.dart';
 @JsonSerializable(explicitToJson: true)

class ResponseGetSupplement {
  final bool success;

  final List<Supplement> data;

  ResponseGetSupplement({
    required this.success,
    required this.data,
  });

  factory ResponseGetSupplement.fromJson(Map<String, dynamic> obj) =>
      _$ResponseGetSupplementFromJson(obj);

  Map<String, dynamic> toJson() => _$ResponseGetSupplementToJson(this);
}