import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

import '../vos/credit_vo.dart';

abstract class MovieModel{
  // Network
  Future<List<MovieVO>>? getNowPlayingMovies(int page);
  Future<List<MovieVO>>? getPopularMovies(int page);
  Future<List<MovieVO>>? getTopRatedMovies(int page);
  Future<List<GenreVO>>? getGenres();
  Future<List<MovieVO>>? getMoviesByGenre(int genreId);
  Future<List<ActorVO>>? getActors(int page);
  Future<MovieVO>? getMovieDetails(int movieId);
  Future<List<CreditVO>>? getCreditsByMovie(int movieId);


  // Database
  Future<List<MovieVO>>? getTopRatedMoviesFromDatabase();
  Future<List<MovieVO>>? getNowPlayingMoviesFromDatabase();
  Future<List<MovieVO>>? getPopularMoviesFromDatabase();
  Future<List<GenreVO>>? getGenresFromDatabase();
  Future<List<ActorVO>>? getActorsFromDatabase();
  Future<MovieVO>? getMovieDetailsFromDatabase(int movieId);

  ///Reactive Programming
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabaseReactive();
  Stream<List<MovieVO>> getPopularMoviesFromDatabaseReactive();
  Stream<List<MovieVO>> getNowTopRelatedMoviesFromDatabaseReactive();

}