import 'package:flutter/widgets.dart';
import 'package:flutter_challenge_startaideia/app/erros/movies_error.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/data/movie_repository.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_model.dart';
import 'package:intl/intl.dart';

class MovieListController extends ChangeNotifier {
  final MovieRepository _repository;

  MovieListController(
    this._repository,
  );

  //
  MovieError? movieError;
  List<MovieModel> _listMovies = [];
  List<MovieModel> get listMovies => _listMovies;
  final dateFormat = DateFormat(DateFormat.YEAR, 'pt_BR');
  //

  void fetchMovieByIdSimilar(int id) async {
    movieError = null;
    var result = await _repository.fetchMovieByIdSimilar(id);
    result.fold(
      (error) => movieError = error,
      (list) => _listMovies = list,
    );
    notifyListeners();
  }
}
