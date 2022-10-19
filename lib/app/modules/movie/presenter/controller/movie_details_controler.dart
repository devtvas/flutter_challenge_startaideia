import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_startaideia/app/erros/movies_error.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/domain/home_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/data/movie_repository.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_detail_model.dart';

class MovieDetailController {
  final _repository = MovieRepository();

  MovieDetailModel? movieDetail;
  MovieError? movieError;

  bool loading = true;

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    movieError = null;
    final result = await _repository.fetchMovieById(id);
    result.fold(
      (error) => movieError = error,
      (detail) => movieDetail = detail,
    );
    return result;
  }
}
