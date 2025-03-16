import 'package:equatable/equatable.dart';
import '../../data/models/movie_detail_model.dart';

abstract class MovieDetailsState extends Equatable {}

class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class MovieDetailsLoading extends MovieDetailsState {
  @override
  List<Object?> get props => [];
}


class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsModel movieDetails;

  MovieDetailsLoaded({required this.movieDetails});

  @override
  List<Object?> get props => [movieDetails];
}

class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;

  MovieDetailsFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
