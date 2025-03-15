import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:tentwenty/features/movie/presentation/cubit/upcoming_movies/upcoming_movies_state.dart';

import '../../../../../core/exception/server_exception.dart';
import '../../../domain/usecase/upcoming_movies/upcoming_movies_usecase.dart';


class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  final UpcomingMoviesUseCase upcomingMoviesUseCase;

  UpcomingMoviesCubit({required this.upcomingMoviesUseCase})
      : super(UpcomingMoviesInitial());

  Future<void> fetchUpcomingMovies() async {
    emit(UpcomingMoviesLoading());
    try {
      final upcomingMoviesData = await upcomingMoviesUseCase.call();
      emit(UpcomingMoviesLoaded(upcomingMovies: upcomingMoviesData));
    } on SocketException {
      emit(const UpcomingMoviesFailure('No Internet connection.'));
    } on ServerException catch (e) {
      emit(UpcomingMoviesFailure(e.message));
    } catch (e) {
      emit(UpcomingMoviesFailure(e.toString()));
    }
  }
}
