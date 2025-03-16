import '../../data/models/movie_detail_model.dart';
import '../repository/movie_details_repository.dart';

class GetMovieDetailsUseCase {
  final MovieDetailsRepository repository;

  GetMovieDetailsUseCase({required this.repository});

  Future<MovieDetailsModel> call(String movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
