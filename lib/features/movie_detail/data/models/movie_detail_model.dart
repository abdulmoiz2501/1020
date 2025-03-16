import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) => MovieDetailsModel.fromJson(json.decode(str));

class MovieDetailsModel {
  final int id;
  final String title;
  final String overview;
  final String? backdropPath;
  final String? releaseDate;
  final List<Genre> genres;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
    id: json['id'],
    title: json['title'],
    overview: json['overview'],
    backdropPath: json['backdrop_path'],
    releaseDate: json['release_date'],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
  );
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json['id'],
    name: json['name'],
  );
}
