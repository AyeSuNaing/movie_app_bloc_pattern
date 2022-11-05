import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/hive_constants.dart';
import 'package:movie_app/data/vos/base_actor_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

part 'actor_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ACTOR_VO, adapterName: "ActorVOAdapter")
class ActorVO extends BaseActorVO{

  // @JsonKey(name: "profile_path")
  // String? profilePath;

  @JsonKey(name: "adult")
  @HiveField(2)
  bool? adult;


  @JsonKey(name: "id")
  @HiveField(3)
  int? id;

  @JsonKey(name: "known_for")
  @HiveField(4)
  List<MovieVO>? knownFor;

  //
  // @JsonKey(name: "name")
  // String? name;


  @JsonKey(name: "popularity")
  @HiveField(5)
  double? popularity;


  ActorVO(this.adult, this.id, this.knownFor, this.popularity , String? name, String? profilePath): super(name,profilePath);
  // ActorVO(this.adult, this.id, this.knownFor, this.popularity , this.name, this.profilePath);

  factory ActorVO.fromJson(Map<String, dynamic> json) => _$ActorVOFromJson(json);

  Map<String,dynamic> toJson() => _$ActorVOToJson(this);
}
