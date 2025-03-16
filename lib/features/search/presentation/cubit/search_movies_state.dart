import 'package:equatable/equatable.dart';

import '../../data/models/search_movies_model.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object?> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final SearchMoviesModel searchMoviesModel;

  const SearchMoviesLoaded({required this.searchMoviesModel});

  @override
  List<Object?> get props => [searchMoviesModel];
}

class SearchMoviesFailure extends SearchMoviesState {
  final String errorMessage;
  const SearchMoviesFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
