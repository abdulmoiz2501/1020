
import 'package:equatable/equatable.dart';

import '../../../data/models/upcoming_movies_model.dart';

abstract class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object?> get props => [];
}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final UpcomingMoviesModel upcomingMovies;
  const UpcomingMoviesLoaded({required this.upcomingMovies});

  @override
  List<Object?> get props => [upcomingMovies];
}

class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String errorMessage;
  const UpcomingMoviesFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
