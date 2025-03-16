import '../../data/models/movie_detail_model.dart';


abstract class MovieDetailsRepository {
  Future<MovieDetailsModel> getMovieDetails(String movieId);
}
