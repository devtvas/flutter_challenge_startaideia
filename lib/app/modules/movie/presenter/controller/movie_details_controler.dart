import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge_startaideia/app/erros/movies_error.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/data/movie_repository.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_detail_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_response_model.dart';
import 'package:intl/intl.dart';

class MovieDetailController extends ChangeNotifier {
  final MovieRepository repository;

  MovieDetailController(
    this.repository,
  );
  MovieDetailModel? movieDetail;
  MovieResponseModel? movieResponseModel;

  MovieError? movieError;
  bool loading = true;
  bool isLike = false;
  //
  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;
  //

  final dateFormat = DateFormat(DateFormat.YEAR, 'pt_BR');

  void like() {
    if (isLike == false) {
      isLike = !isLike;
      notifyListeners();
    } else {
      isLike = !isLike;
      notifyListeners();
    }
  }

  void fetchMovieByIdSimilar(int id) async {
    movieError = null;
    var result = await repository.fetchMovieByIdSimilar(id);
    result.fold(
      (error) => movieError = error,
      (list) => _movies = list,
    );
    notifyListeners();
  }

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    movieError = null;
    var result = await repository.fetchMovieById(id);
    result.fold(
      (error) => movieError = error,
      (detail) => movieDetail = detail,
    );
    print('Ctrl: ' + movieDetail!.voteCount.toString());
    notifyListeners();
    return result;
  }
}
