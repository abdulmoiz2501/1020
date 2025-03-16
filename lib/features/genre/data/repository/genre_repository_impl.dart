import '../../../../core/exception/server_exception.dart';
import '../models/genre_model.dart';
import '../source/genre_remote_source.dart';
import '../../domain/repository/genre_repository.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreRemoteDataSource remoteDataSource;

  GenreRepositoryImpl({required this.remoteDataSource});

  @override
  Future<GenreModel> getGenres() async {
    try {
      return await remoteDataSource.getGenres();
    } on ServerException catch (e) {
      throw e;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
