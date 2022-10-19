import 'package:dio/dio.dart';
import 'package:flutter_challenge_startaideia/app/core/api.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/domain/home_model.dart';

class HomeRepository {
  final Dio _dio = Dio(kDioOptions);

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
