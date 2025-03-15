
import 'package:equatable/equatable.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object?> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  // final SearchResult result;

}

class SearchMoviesFailure extends SearchMoviesState {
  // final String message;

}
