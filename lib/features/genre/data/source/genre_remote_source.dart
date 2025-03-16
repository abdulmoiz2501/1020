import '../models/genre_model.dart';

abstract class GenreRemoteDataSource {
  Future<GenreModel> getGenres();
}
