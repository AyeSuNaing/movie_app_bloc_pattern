// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetActorResponse _$GetActorResponseFromJson(Map<String, dynamic> json) =>
    GetActorResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetActorResponseToJson(GetActorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'results': instance.actors,
    };
