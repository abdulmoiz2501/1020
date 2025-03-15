import '../../../data/models/movie_details_model.dart';
import '../../repository/latest_movie_repository.dart';

class GetMovieDetailsUseCase {
  final LatestMovieRepository repository;

  GetMovieDetailsUseCase({required this.repository});

  Future<MovieDetailsModel> call(String movieId) async {
    return repository.getMovieDetails(movieId);
  }
}
