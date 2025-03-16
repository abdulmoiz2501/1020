import '../models/movie_detail_model.dart';

abstract class MovieDetailsRemoteSource {
  Future<MovieDetailsModel> getMovieDetails(String movieId);
}
