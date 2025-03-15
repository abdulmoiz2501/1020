import 'package:equatable/equatable.dart';
import '../../../data/models/upcoming_movies_model.dart';

abstract class DiscoverMoviesState extends Equatable {
  const DiscoverMoviesState();

  @override
  List<Object?> get props => [];
}

class DiscoverMoviesInitial extends DiscoverMoviesState {}

class DiscoverMoviesLoading extends DiscoverMoviesState {}

class DiscoverMoviesLoaded extends DiscoverMoviesState {
  final UpcomingMoviesModel discoverMovies;
  const DiscoverMoviesLoaded(this.discoverMovies);

  @override
  List<Object?> get props => [discoverMovies];
}

class DiscoverMoviesFailure extends DiscoverMoviesState {
  final String errorMessage;
  const DiscoverMoviesFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
