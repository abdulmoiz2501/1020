import '../models/upcoming_movies_model.dart';

abstract class LatestMoviesRemoteDataSource {



  Future<UpcomingMoviesModel> getDiscoverMovies();

}
