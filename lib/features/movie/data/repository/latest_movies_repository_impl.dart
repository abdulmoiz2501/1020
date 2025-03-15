
import '../../domain/repository/latest_movie_repository.dart';
import '../models/genre_model.dart';
import '../models/movie_details_model.dart';
import '../models/upcoming_movies_model.dart';
import '../source/latest_movies_remote_source.dart';

class LatestMoviesRepositoryImpl implements LatestMovieRepository {
  final LatestMoviesRemoteDataSource remoteDataSource;

  LatestMoviesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UpcomingMoviesModel> getUpcomingMovies() {
    return remoteDataSource.getUpcomingMovies();
  }

  @override
  Future<GenreModel> getGenre() {
    return remoteDataSource.getGenre();
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(String movieId) {
    return remoteDataSource.getMovieDetails(movieId);
  }
  @override
  Future<UpcomingMoviesModel> getDiscoverMovies() {
    return remoteDataSource.getDiscoverMovies();
  }

}
