import '../../data/models/search_movies_model.dart';
import '../repository/search_movies_repository.dart';

class SearchMoviesUseCase {
  final SearchMoviesRepository repository;

  SearchMoviesUseCase({required this.repository});

  Future<SearchMoviesModel> call(String query) async {
    return repository.searchMovies(query);
  }
}
