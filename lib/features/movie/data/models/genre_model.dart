import 'dart:convert';

GenreModel genreModelFromJson(String str) =>
    GenreModel.fromJson(json.decode(str));

class GenreModel {
  final List<Genre> genres;

  GenreModel({required this.genres});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      genres: List<Genre>.from(
        json["genres"].map((x) => Genre.fromJson(x)),
      ),
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json["id"],
      name: json["name"],
    );
  }
}
