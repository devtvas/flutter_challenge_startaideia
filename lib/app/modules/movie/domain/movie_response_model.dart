import 'dart:convert';

import 'movie_model.dart';

class MovieResponseModel {
  int? page;
  final List<MovieModel> movies = [];
  final int? totalPages;
  final int? totalResults;

  MovieResponseModel({
    this.page,
    movies,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponseModel.fromJson(String str) =>
      MovieResponseModel.fromMap(json.decode(str));

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) =>
      MovieResponseModel(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        movies: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x))),
      );
}
