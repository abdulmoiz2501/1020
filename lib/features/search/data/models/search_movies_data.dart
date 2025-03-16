class SearchMoviesData {
  final int id;
  final String? title;
  final String? backdropPath;
  final List<int> genreIds;

  SearchMoviesData({
    required this.id,
    this.title,
    this.backdropPath,
    required this.genreIds,
  });

  factory SearchMoviesData.fromJson(Map<String, dynamic> json) {
    return SearchMoviesData(
      id: json['id'],
      title: json['title'] ?? '',
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }
}
