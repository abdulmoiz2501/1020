import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) =>
    MovieDetailsModel.fromJson(json.decode(str));

class MovieDetailsModel {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json["id"],
      title: json["title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
    );
  }
}
