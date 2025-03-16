import 'package:bloc/bloc.dart';
import '../../domain/usecase/get_movie_details_usecase.dart';
import 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsCubit({required this.getMovieDetailsUseCase}) : super(MovieDetailsInitial());

  fetchMovieDetails(String movieId) async {
    emit(MovieDetailsLoading());
    try {
      final movieDetails = await getMovieDetailsUseCase(movieId);
      emit(MovieDetailsLoaded(movieDetails: movieDetails));
    } catch (e) {
      emit(MovieDetailsFailure(e.toString()));
    }
  }
}
