import '../../domain/repository/movie_details_repository.dart';
import '../models/movie_detail_model.dart';
import '../source/movie_details_source.dart';


class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteSource remoteDataSource;

  MovieDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<MovieDetailsModel> getMovieDetails(String movieId) async {
    return await remoteDataSource.getMovieDetails(movieId);
  }
}
