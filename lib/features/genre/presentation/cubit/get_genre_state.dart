
import 'package:equatable/equatable.dart';

import '../../data/models/genre_model.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object?> get props => [];
}

class GenreInitial extends GenreState {}

class GenreLoading extends GenreState {}

class GenreLoaded extends GenreState {
  final GenreModel genreModel;

  const GenreLoaded({required this.genreModel});

  @override
  List<Object?> get props => [genreModel];
}

class GenreFailure extends GenreState {
  final String message;
  const GenreFailure(this.message);

  @override
  List<Object?> get props => [message];
}
