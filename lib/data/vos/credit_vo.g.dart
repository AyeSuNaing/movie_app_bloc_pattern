// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditVOAdapter extends TypeAdapter<CreditVO> {
  @override
  final int typeId = 4;

  @override
  CreditVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditVO(
      fields[2] as bool?,
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as double?,
      fields[7] as int?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as int?,
      fields[0] as String?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CreditVO obj) {
    writer
      ..writeByte(11)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.knowForDepartment)
      ..writeByte(5)
      ..write(obj.originalName)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.castId)
      ..writeByte(8)
      ..write(obj.character)
      ..writeByte(9)
      ..write(obj.creditId)
      ..writeByte(10)
      ..write(obj.order)
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
      other is CreditVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditVO _$CreditVOFromJson(Map<String, dynamic> json) => CreditVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['known_for_department'] as String?,
      json['original_name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['cast_id'] as int?,
      json['character'] as String?,
      json['credit_id'] as String?,
      json['order'] as int?,
      json['name'] as String?,
      json['profile_path'] as String?,
    );

Map<String, dynamic> _$CreditVOToJson(CreditVO instance) => <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
      'adult': instance.id,
      'gender': instance.gender,
      'known_for_department': instance.knowForDepartment,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };
