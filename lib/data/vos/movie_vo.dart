import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/persistence/hive_constants.dart';
import 'package:movie_app/data/vos/collection_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/production_company_vo.dart';
import 'package:movie_app/data/vos/production_country_vo.dart';
import 'package:hive/hive.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_MOVIE_VO, adapterName: 'MovieVOAdapter')
class MovieVO{
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backDropPath;

  @JsonKey(name: "genre_ids")
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: 'belongs_to_collection')
  @HiveField(3)
  CollectionVO? belognsToCollection;

  @JsonKey(name: 'budget')
  @HiveField(4)
  double? budget;

  @JsonKey(name: 'genres')
  @HiveField(5)
  List<GenreVO>? genres;

  @JsonKey(name: 'homepage')
  @HiveField(6)
  String? homepage;

  @JsonKey(name: "id")
  @HiveField(7)
  int? id;

  @JsonKey(name: "imdb_id")
  @HiveField(8)
  String? imdbId;

  @JsonKey(name: "original_language")
  @HiveField(9)
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(10)
  String? originalTitle;

  @JsonKey(name: "overview")
  @HiveField(11)
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(12)
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(13)
  String? posterPath;

  @JsonKey(name: "release_date")
  @HiveField(14)
  String? releaseDate;

  @JsonKey(name: "title")
  @HiveField(15)
  String? title;

  @JsonKey(name: "revenue")
  @HiveField(16)
  int? revenue;

  @JsonKey(name: "status")
  @HiveField(17)
  String? status;

  @JsonKey(name: "tagline")
  @HiveField(18)
  String? tagline;

  @JsonKey(name: "runtime")
  @HiveField(19)
  int? runtime;


  @JsonKey(name: 'production_companies')
  @HiveField(20)
  List<ProductionCompanyVO>? prodcutionCompanies;

  @JsonKey(name: 'production_countries')
  @HiveField(21)
  List<ProductionCountryVO>? prodcutionCountries;


  @JsonKey(name: "video")
  @HiveField(22)
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(23)
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(24)
  int? voteCount;

  @HiveField(25)
  bool? isNowPlaying;

  @HiveField(26)
  bool? isPopular;

  @HiveField(27)
  bool? isTopRated;


  MovieVO(
      this.adult,
      this.backDropPath,
      this.genreIds,
      this.belognsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.revenue,
      this.status,
      this.tagline,
      this.runtime,
      this.prodcutionCompanies,
      this.prodcutionCountries,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.isNowPlaying,
      this.isPopular,
      this.isTopRated);

  // static MovieVO empty(){
  //   return MovieVO(false, "", [],  null, 0, [], "", 0, "0",  "", "","", 0, "", "", "", 0, "0" , "", 1, [], [], false, 0, 0,false,false,false);
  // }

  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, isNowPlaying: $isNowPlaying, isPopular: $isPopular, isTopRated: $isTopRated}';
  }


}

