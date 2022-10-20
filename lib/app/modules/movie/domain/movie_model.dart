import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final DateTime releaseDate;
  final String posterPath;
  final String backdropPath;
  final String overview;

  const MovieModel({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
  });

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        posterPath: json["poster_path"],
        id: json["id"],
        backdropPath: json["backdrop_path"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );
}
