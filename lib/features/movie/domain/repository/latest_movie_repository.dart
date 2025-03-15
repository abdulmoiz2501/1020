import '../../data/models/genre_model.dart';
import '../../data/models/movie_details_model.dart';
import '../../data/models/upcoming_movies_model.dart';

abstract class LatestMovieRepository {
  Future<UpcomingMoviesModel> getUpcomingMovies();
  Future<GenreModel> getGenre();
  Future<MovieDetailsModel> getMovieDetails(String movieId);

  Future<UpcomingMoviesModel> getDiscoverMovies();
}
