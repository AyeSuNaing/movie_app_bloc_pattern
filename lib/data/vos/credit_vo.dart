import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/hive_constants.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'credit_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CREDIT_VO, adapterName: "CreditVOAdapter")
class CreditVO extends BaseActorVO{

  @JsonKey(name: 'adult')
  @HiveField(2)
  bool? id;

  @JsonKey(name: 'gender')
  @HiveField(3)
  int? gender;

  @JsonKey(name: 'known_for_department')
  @HiveField(4)
  String? knowForDepartment;
/*
  @JsonKey(name: 'name')
  String? name;*/

  @JsonKey(name: 'original_name')
  @HiveField(5)
  String? originalName;

  @JsonKey(name: 'popularity')
  @HiveField(6)
  double? popularity;

/*

  @JsonKey(name: 'profile_path')
  String? profilePath;
*/

  @JsonKey(name: 'cast_id')
  @HiveField(7)
  int? castId;

  @JsonKey(name: 'character')
  @HiveField(8)
  String? character;

  @JsonKey(name: 'credit_id')
  @HiveField(9)
  String? creditId;

  @JsonKey(name: 'order')
  @HiveField(10)
  int? order;



  bool isActor(){
    return knowForDepartment == KNOWN_FOR_DEPARTMENT_ACTING;
  }

  bool isCreator(){
    return knowForDepartment != KNOWN_FOR_DEPARTMENT_ACTING;
  }


  CreditVO(this.id, this.gender, this.knowForDepartment, this.originalName,
      this.popularity, this.castId, this.character, this.creditId, this.order, String? name, String? profilePath): super(name,profilePath);

  factory CreditVO.fromJson(Map<String, dynamic> json) => _$CreditVOFromJson(json);

  Map<String, dynamic> toJson() => _$CreditVOToJson(this);
}

const String KNOWN_FOR_DEPARTMENT_ACTING = "Acting";


