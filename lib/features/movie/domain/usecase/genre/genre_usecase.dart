import '../../../data/models/genre_model.dart';
import '../../repository/latest_movie_repository.dart';

class GetGenreUseCase {
  final LatestMovieRepository repository;

  GetGenreUseCase({required this.repository});

  Future<GenreModel> call() async {
    return repository.getGenre();
  }
}
