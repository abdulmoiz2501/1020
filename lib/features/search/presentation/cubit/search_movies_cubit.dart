import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

import 'package:tentwenty/features/search/presentation/cubit/search_movies_state.dart';

import '../../domain/usecase/search_movies_usecase.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final SearchMoviesUseCase searchMoviesUseCase;

  SearchMoviesCubit({required this.searchMoviesUseCase})
      : super(SearchMoviesInitial());

  Future<void> searchMovies({required String query}) async {
    emit(SearchMoviesLoading());
    try {
      final result = await searchMoviesUseCase.call(query);
      emit(SearchMoviesLoaded(searchMoviesModel: result));
    } on SocketException {
      emit(SearchMoviesFailure(errorMessage: 'No Internet connection.'));
    } catch (e) {
      emit(SearchMoviesFailure(errorMessage: e.toString()));
    }
  }
}
