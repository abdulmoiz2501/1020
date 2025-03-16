import '../models/search_movies_model.dart';

abstract class SearchMoviesRemoteDataSource {
  Future<SearchMoviesModel> searchMovies(String query);
}
