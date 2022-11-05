import 'package:dio/dio.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/responses/actor_response.dart';
import 'package:movie_app/network/responses/credit_response.dart';
import 'package:movie_app/network/responses/genre_response.dart';
import 'package:movie_app/network/responses/get_movies_by_genre_response.dart';
import 'package:movie_app/network/responses/movie_list_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheMovieApi{
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @GET(ENDPOINT_GET_NOW_PLAYING)
  Future<MovieListResponse> getNowPlayingMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_POPULAR)
  Future<MovieListResponse> getPopularMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_TOP_RATED)
  Future<MovieListResponse> getTopRatedMovies(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET(ENDPOINT_GET_GENRES)
  Future<GetGenreResponse> getGenrees(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      );


  @GET(ENDPOINT_GET_MOVIES_BY_GENRES)
  Future<MovieListResponse> getMoviesByGenre(
      @Query(PARAM_GENRE_ID) String genreId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      );
/*
  @GET("$ENDPOINT_GET_MOVIES_BY_GENRES/{genre_id}")
  Future<GetMoviesByGenreResponse> getMoviesByGenre(
      @Path("genre_id") String genreId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      );*/

  @GET(ENDPOINT_GET_ACTOR)
  Future<GetActorResponse> getActors(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET('$ENDPOINT_GET_MOVIE_DETAIL/{movie_id}')
  Future<MovieVO> getMovieDetail(
      @Path('movie_id') String movieId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

  @GET('$ENDPOINT_GET_CREDITS_BY_MOVIE/{movie_id}/credits')
  Future<CreditResponse> getCreditsByMovieResponse(
      @Path('movie_id') String movieId,
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LANGUAGE) String language,
      @Query(PARAM_PAGE) String page
      );

}