// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditResponse _$CreditResponseFromJson(Map<String, dynamic> json) =>
    CreditResponse(
      json['id'] as int?,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CreditVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditResponseToJson(CreditResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
