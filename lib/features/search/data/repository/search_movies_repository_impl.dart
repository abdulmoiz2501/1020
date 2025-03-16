import '../../domain/repository/search_movies_repository.dart';
import '../models/search_movies_model.dart';
import '../source/search_movies_remote_source.dart';

class SearchMoviesRepositoryImpl implements SearchMoviesRepository {
  final SearchMoviesRemoteDataSource remoteDataSource;

  SearchMoviesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SearchMoviesModel> searchMovies(String query) async {
    return remoteDataSource.searchMovies(query);
  }
}
