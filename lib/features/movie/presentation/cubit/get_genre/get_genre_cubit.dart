import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/exception/server_exception.dart';
import '../../../domain/usecase/genre/genre_usecase.dart';
import 'get_genre_state.dart';


class GenreCubit extends Cubit<GenreState> {
  final GetGenreUseCase genreUseCase;

  GenreCubit({required this.genreUseCase}) : super(GenreInitial());

  Future<void> fetchGenres() async {
    emit(GenreLoading());
    try {
      final genreModel = await genreUseCase.call();
      emit(GenreLoaded(genreModel: genreModel));

      
    } on ServerException catch (e) {
      emit(GenreFailure(e.message));
    } catch (e) {
      emit(GenreFailure(e.toString()));
    }
  }
}
