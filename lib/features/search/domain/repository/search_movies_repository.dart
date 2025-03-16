import '../../data/models/search_movies_model.dart';

abstract class SearchMoviesRepository {
  Future<SearchMoviesModel> searchMovies(String query);
}
