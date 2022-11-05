// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorVOAdapter extends TypeAdapter<ActorVO> {
  @override
  final int typeId = 1;

  @override
  ActorVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorVO(
      fields[2] as bool?,
      fields[3] as int?,
      (fields[4] as List?)?.cast<MovieVO>(),
      fields[5] as double?,
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ActorVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(2)
      ..write(obj.adult)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.knownFor)
      ..writeByte(5)
      ..write(obj.popularity)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorVO _$ActorVOFromJson(Map<String, dynamic> json) => ActorVO(
      json['adult'] as bool?,
      json['id'] as int?,
      (json['known_for'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['popularity'] as num?)?.toDouble(),
      json['name'] as String?,
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$ActorVOToJson(ActorVO instance) => <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'id': instance.id,
      'known_for': instance.knownFor,
      'popularity': instance.popularity,
    };
