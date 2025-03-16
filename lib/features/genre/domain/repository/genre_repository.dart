import '../../data/models/genre_model.dart';


abstract class GenreRepository {
  Future<GenreModel> getGenres();
}
