import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/persistence/hive_constants.dart';


class MovieDao{
  static final MovieDao _singleton = MovieDao._internal();
  factory MovieDao(){
    return _singleton;
  }
  MovieDao._internal();

  void saveMovies(List<MovieVO> movies) async {
    debugPrint("movie dao save movies ${movies.length}");
    Map<int, MovieVO> movieMap = Map.fromIterable(movies,
      key: (movie) => movie.id,
      value: (movie) => movie
    );

    await getMovieBox().putAll(movieMap);
  }

  void saveSingleMovie(MovieVO movie) async{
    return getMovieBox().put(movie.id, movie);
  }

  List<MovieVO> getAllMovies(){
    return getMovieBox().values.toList();
  }

  MovieVO? getMovieById(int movieId){
    return getMovieBox().get(movieId);
  }



  ///Reactive Programming

  Stream<void> getAllMovieEventStream() {
    return getMovieBox().watch();
  }

  Stream<List<MovieVO>> getNowPlayingMovieStream () {
    return Stream.value(getAllMovies().where((movie) => movie?.isNowPlaying ?? false).toList());
  }

  Stream<List<MovieVO>> getPopularMovieStream () {
    return Stream.value(getAllMovies().where((movie) => movie?.isPopular ?? false).toList());
  }

  Stream<List<MovieVO>> getTopRatedMovieStream () {
    return Stream.value(getAllMovies().where((movie) => movie?.isTopRated ?? false).toList());
  }

  List<MovieVO> getNowPlayingMovie() {
    if ((getAllMovies().isNotEmpty ?? false)) {
      print("movie_dao getNowPlayingMovew   is not empty  ");
      return getAllMovies().where((movie) => movie?.isNowPlaying ?? false).toList();
    } else {
      print("movie_dao getNowPlayingMovew   is empty  ");

      return [];
    }


  }

  List<MovieVO> getPopularMovie () {
    if ((getAllMovies().isNotEmpty ?? false)) {
      return getAllMovies().where((movie) => movie?.isPopular ?? false).toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getTopRatedMovie () {
    if ((getAllMovies().isNotEmpty ?? false)) {
      return getAllMovies().where((movie) => movie?.isTopRated ?? false).toList();
    } else {
      return [];
    }
  }

  Box<MovieVO> getMovieBox(){
    return Hive.box<MovieVO>(BOX_NAME_MOVIE_VO);
  }
}