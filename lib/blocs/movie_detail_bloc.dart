import 'dart:async';

import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/credit_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/data/models/movie_model.dart';

class MovieDetailsBloc {

  /// Stream Controller
  StreamController<MovieVO>  movieStreamController = StreamController();
  StreamController<List<CreditVO>> creatorsStreamController = StreamController();
  StreamController<List<CreditVO>> actorsStreamController = StreamController();

  /// Models
  MovieModel mMovieModel = MovieModelImpl();

  MovieDetailsBloc (int movieId) {
    /// Movie Details
     mMovieModel.getMovieDetails(movieId)?.then((movie) {
        movieStreamController.sink.add(movie);
     });

     /// Movie Details Database
    mMovieModel.getMovieDetailsFromDatabase(movieId)?.then((movie)  {
      movieStreamController.sink.add(movie);
    });

    mMovieModel.getCreditsByMovie(movieId)?.then((creditList) {
      actorsStreamController.sink.add(creditList.where((credit) => credit.isActor()).toList());
      creatorsStreamController.sink.add(creditList.where((credit) => credit.isCreator()).toList());
    });
  }

  void disposeStreams () {
    movieStreamController.close();
    actorsStreamController.close();
    creatorsStreamController.close();
  }

}