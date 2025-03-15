import 'dart:io';
import 'package:bloc/bloc.dart';
import '../../../../../core/exception/server_exception.dart';
import '../../../domain/usecase/discover_movies/discover_movies_usecase.dart';
import 'discover_movies_state.dart';

class DiscoverMoviesCubit extends Cubit<DiscoverMoviesState> {
  final DiscoverMoviesUseCase discoverMoviesUseCase;

  DiscoverMoviesCubit({required this.discoverMoviesUseCase})
      : super(DiscoverMoviesInitial());

  Future<void> fetchDiscoverMovies() async {
    emit(DiscoverMoviesLoading());
    try {
      final moviesData = await discoverMoviesUseCase.call();
      emit(DiscoverMoviesLoaded(moviesData));
    } on SocketException {
      emit(const DiscoverMoviesFailure('No Internet connection.'));
    } on ServerException catch (e) {
      emit(DiscoverMoviesFailure(e.message));
    } catch (e) {
      emit(DiscoverMoviesFailure(e.toString()));
    }
  }
}
