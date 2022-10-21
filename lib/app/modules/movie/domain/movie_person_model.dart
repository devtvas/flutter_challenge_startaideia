import 'dart:convert';

class MoviePersonModel {
  final String name;
  final String profile_path;
  final double popularity;

  const MoviePersonModel({
    required this.name,
    required this.profile_path,
    required this.popularity,
  });

  factory MoviePersonModel.fromJson(String str) =>
      MoviePersonModel.fromMap(json.decode(str));

  factory MoviePersonModel.fromMap(Map<String, dynamic> json) =>
      MoviePersonModel(
        name: json["name"],
        profile_path: json["profile_path"],
        popularity: json["popularity"].toDouble(),
      );
}
