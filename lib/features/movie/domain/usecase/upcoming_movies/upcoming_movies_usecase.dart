import '../../../data/models/upcoming_movies_model.dart';
import '../../repository/latest_movie_repository.dart';

class UpcomingMoviesUseCase {
  final LatestMovieRepository repository;

  UpcomingMoviesUseCase({required this.repository});

  Future<UpcomingMoviesModel> call() async {
    return repository.getUpcomingMovies();
  }
}
