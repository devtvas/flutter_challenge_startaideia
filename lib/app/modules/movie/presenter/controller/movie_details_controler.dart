import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge_startaideia/app/erros/movies_error.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/data/movie_repository.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_detail_model.dart';

class MovieDetailController extends ChangeNotifier {
  final MovieRepository repository;

  MovieDetailController(this.repository);

  MovieDetailModel? movieDetail;
  MovieError? movieError;
  bool loading = true;

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    movieError = null;
    var result = await repository.fetchMovieById(id);
    result.fold(
      (error) => movieError = error,
      (detail) => movieDetail = detail,
    );
    print(movieDetail);
    return result;
  }
}
