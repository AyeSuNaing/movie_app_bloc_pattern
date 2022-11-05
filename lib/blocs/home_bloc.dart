import 'dart:async';

import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class HomeBloc {
  ///Reactive Stream
  late StreamController<List<MovieVO>> mNowPlayingStreamController = StreamController();
  late StreamController<List<MovieVO>> mPopularMoviesListStreamController = StreamController();
  late StreamController<List<GenreVO>> mGenreListStreamController = StreamController();
  late StreamController<List<ActorVO>> mActorsStreamController = StreamController();
  late StreamController<List<MovieVO>> mShowCaseMoviesListStreamController = StreamController();
  late StreamController<List<MovieVO>> mMoviesByGenreListStreamController = StreamController();


  ///Model
  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc () {
    /// Now PLaying Movies Database
    mMovieModel.getNowPlayingMoviesFromDatabase()?.then((movieList) {
      print("this is getting triggered!");
      mNowPlayingStreamController.sink.add(movieList);
    }).catchError((error){});

    /// Popular Movies Database
    mMovieModel.getPopularMoviesFromDatabase()?.then((movieList) {
      mPopularMoviesListStreamController.sink.add(movieList);
    }).catchError((error){});

    /// Genres
    mMovieModel.getGenres()?.then((genreList) {
      mGenreListStreamController.sink.add(genreList);
      /// Movies By Genre
      getMoviesByGenreAndRefresh(genreList.first.id ?? 0);
    }).catchError((error){});

    /// Genres Database
    mMovieModel.getGenresFromDatabase()?.then((genreList) {
      mGenreListStreamController.sink.add(genreList);
      /// Movies By Genre
      getMoviesByGenreAndRefresh(genreList.first.id ?? 0);

    }).catchError((error){});

    /// Showcase Database
    mMovieModel.getTopRatedMoviesFromDatabase()?.then((movieList) {
      mShowCaseMoviesListStreamController.sink.add(movieList);
    }).catchError((error) {});

    /// Actors
    mMovieModel.getActors(1)?.then((actorList) {
      mActorsStreamController.sink.add(actorList);
    }).catchError((error){});

    /// Actors Database
    mMovieModel.getActorsFromDatabase()?.then((actorList) {
      mActorsStreamController.sink.add(actorList);
    }).catchError((error){});

  }

  void onTapGenre(int genreId){
    getMoviesByGenreAndRefresh(genreId);
  }

  void getMoviesByGenreAndRefresh(int genreId){
    mMovieModel.getMoviesByGenre(genreId)?.then((movieByGenre) {
      mMoviesByGenreListStreamController.sink.add(movieByGenre);
    }).catchError((error){});
  }

  void dispose() {
    mNowPlayingStreamController.close();
    mPopularMoviesListStreamController.close();
    mGenreListStreamController.close();
    mActorsStreamController.close();
    mShowCaseMoviesListStreamController.close();
    mMoviesByGenreListStreamController.close();
  }

}