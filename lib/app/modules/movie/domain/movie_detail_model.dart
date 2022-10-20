import 'dart:convert';

class MovieDetailModel {
  final double? popularity;
  final int voteCount;

  const MovieDetailModel({
    this.popularity,
    required this.voteCount,
  });

  factory MovieDetailModel.fromJson(String str) =>
      MovieDetailModel.fromMap(json.decode(str));

  factory MovieDetailModel.fromMap(Map<String, dynamic> json) =>
      MovieDetailModel(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
      );
}
