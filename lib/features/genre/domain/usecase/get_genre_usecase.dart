import '../../data/models/genre_model.dart';
import '../repository/genre_repository.dart';

class GetGenresUseCase {
  final GenreRepository repository;

  GetGenresUseCase({required this.repository});

  Future<GenreModel> call() async {
    return repository.getGenres();
  }
}
