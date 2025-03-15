import '../../../data/models/upcoming_movies_model.dart';
import '../../repository/latest_movie_repository.dart';

class DiscoverMoviesUseCase {
  final LatestMovieRepository repository;

  DiscoverMoviesUseCase({required this.repository});

  Future<UpcomingMoviesModel> call() async {
    return repository.getDiscoverMovies();
  }
}
