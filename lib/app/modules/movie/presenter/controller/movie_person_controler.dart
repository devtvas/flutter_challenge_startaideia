import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge_startaideia/app/erros/movies_error.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/data/movie_repository.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_person_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_model.dart';
import 'package:intl/intl.dart';

class MoviePersonController extends ChangeNotifier {
  final MovieRepository _repository;

  MoviePersonController(
    this._repository,
  );

  //
  MoviePersonModel _moviePersonModel = const MoviePersonModel(
    name: '',
    profile_path: '',
    popularity: 0,
  );
  MovieError? movieError;
  bool loading = true;
  bool isLike = false;
  final dateFormat = DateFormat(DateFormat.YEAR, 'pt_BR');
  MoviePersonModel get movies => _moviePersonModel;
  //

  void like() {
    if (isLike == false) {
      isLike = !isLike;
      notifyListeners();
    } else {
      isLike = !isLike;
      notifyListeners();
    }
  }

  Future<Either<MovieError, MoviePersonModel>> fetchMoviePersonById(
      int id) async {
    movieError = null;
    var result = await _repository.fetchMoviePersonById(id);
    result.fold(
      (error) => movieError = error,
      (detail) => _moviePersonModel = detail,
    );
    notifyListeners();
    return result;
  }
}
