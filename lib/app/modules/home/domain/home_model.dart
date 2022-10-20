import 'dart:convert';

class HomeModel {
  final int? id;
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final String? posterPath;
  final bool? adult;
  final String? backdropPath;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genreIds;
  final String? title;
  final double? voteAverage;
  final String? overview;
  final DateTime? releaseDate;

  const HomeModel({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory HomeModel.fromJson(String str) => HomeModel.fromMap(json.decode(str));

  factory HomeModel.fromMap(Map<String, dynamic> json) => HomeModel(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );
}
