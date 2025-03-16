
import '../../domain/repository/latest_movie_repository.dart';
import '../models/upcoming_movies_model.dart';
import '../source/latest_movies_remote_source.dart';

class LatestMoviesRepositoryImpl implements LatestMovieRepository {
  final LatestMoviesRemoteDataSource remoteDataSource;

  LatestMoviesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UpcomingMoviesModel> getDiscoverMovies() {
    return remoteDataSource.getDiscoverMovies();
  }
}
