import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/exception/server_exception.dart';
import '../../domain/usecase/get_genre_usecase.dart';
import 'get_genre_state.dart';




class GenreCubit extends Cubit<GenreState> {
  final GetGenresUseCase getGenresUseCase;

  GenreCubit({required this.getGenresUseCase}) : super(GenreInitial());

  Future<void> fetchGenres() async {
    emit(GenreLoading());
    try {
      final genreModel = await getGenresUseCase.call();
      emit(GenreLoaded(genreModel: genreModel));
    } on ServerException catch (e) {
      emit(GenreFailure(e.message));
    } catch (e) {
      emit(GenreFailure(e.toString()));
    }
  }
}
