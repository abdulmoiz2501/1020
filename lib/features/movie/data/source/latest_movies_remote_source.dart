import '../models/genre_model.dart';
import '../models/movie_details_model.dart';
import '../models/upcoming_movies_model.dart';

abstract class LatestMoviesRemoteDataSource {
  Future<UpcomingMoviesModel> getUpcomingMovies();
  Future<GenreModel> getGenre();
  Future<MovieDetailsModel> getMovieDetails(String movieId);


  Future<UpcomingMoviesModel> getDiscoverMovies();

}
