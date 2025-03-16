import '../../data/models/upcoming_movies_model.dart';

abstract class LatestMovieRepository {


  Future<UpcomingMoviesModel> getDiscoverMovies();
}
