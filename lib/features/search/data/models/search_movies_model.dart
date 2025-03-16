import 'package:tentwenty/features/search/data/models/search_movies_data.dart';

class SearchMoviesModel {
  final int page;
  final List<SearchMoviesData> results;
  final int totalResults;
  final int totalPages;

  SearchMoviesModel({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  factory SearchMoviesModel.fromJson(Map<String, dynamic> json) {
    return SearchMoviesModel(
      page: json['page'],
      results: (json['results'] as List)
          .map((item) => SearchMoviesData.fromJson(item))
          .toList(),
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
    );
  }
}
