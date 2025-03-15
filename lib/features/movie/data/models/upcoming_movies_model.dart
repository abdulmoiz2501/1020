import 'dart:convert';

UpcomingMoviesModel upcomingMoviesModelFromJson(String str) =>
    UpcomingMoviesModel.fromJson(json.decode(str));

class UpcomingMoviesModel {
  final int page;
  final List<MovieItem> results;
  final int totalPages;
  final int totalResults;

  UpcomingMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMoviesModel(
      page: json["page"],
      results: List<MovieItem>.from(
        json["results"].map((x) => MovieItem.fromJson(x)),
      ),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }
}

class MovieItem {
  final String title;
  final String? posterPath;
  final String? releaseDate;
  final String overview;

  MovieItem({
    required this.title,
    this.posterPath,
    this.releaseDate,
    required this.overview,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      title: json["title"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      overview: json["overview"] ?? '',
    );
  }
}
