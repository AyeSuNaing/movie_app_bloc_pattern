import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/actor_vo.dart';

part 'actor_response.g.dart';

@JsonSerializable()
class GetActorResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "results")
  List<ActorVO>? actors;

  GetActorResponse(this.code, this.message, this.actors);

  factory GetActorResponse.fromJson(Map<String, dynamic> json) => _$GetActorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetActorResponseToJson(this);
}