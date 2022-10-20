import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_challenge_startaideia/app/core/api.dart';
import 'package:flutter_challenge_startaideia/app/erros/movies_error.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/domain/home_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_detail_model.dart';

class MovieRepository {
  final Dio _dio = Dio(kDioOptions);

  Future<Either<MovieError, MovieDetailModel>> fetchMovieSimiliar(
      int movie_id) async {
    try {
      final response = await _dio.get('/movie/$movie_id/similar');
      final model = MovieDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response!.data['status_message']));
      } else {
        return Left(MovieRepositoryError(kServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    try {
      final response = await _dio.get('/movie/$id');
      final model = MovieDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response!.data['status_message']));
      } else {
        return Left(MovieRepositoryError(kServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }

  Future fetchAllMovies(int page) async {
    try {
      final response = await _dio.get('/movie/popular?page=$page');
      final model = MovieModel.fromMap(response.data);
      return model;
    } on DioError catch (e) {
      print(e);
    }
  }
}
