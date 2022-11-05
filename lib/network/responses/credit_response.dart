import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/credit_vo.dart';

part 'credit_response.g.dart';

@JsonSerializable()
class CreditResponse{

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'cast')
  List<CreditVO>? cast;

  CreditResponse(this.id, this.cast);

  factory CreditResponse.fromJson(Map<String, dynamic> json) => _$CreditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditResponseToJson(this);
}