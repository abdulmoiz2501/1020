import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../genre/presentation/cubit/get_genre_cubit.dart';
import '../../../genre/presentation/cubit/get_genre_state.dart';
import '../../../movie/presentation/cubit/discover_movies/discover_movies_cubit.dart';
import '../../../movie/presentation/cubit/discover_movies/discover_movies_state.dart';
import '../cubit/search_movies_cubit.dart';
import '../cubit/search_movies_state.dart';
import '../widgets/search_initial.dart';
import '../widgets/search_item_list.dart';
import '../widgets/search_loading.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      builder: (context, searchState) {
        if (searchState is SearchMoviesLoading) {
          return const SearchLoadingShimmer();
        } else if (searchState is SearchMoviesLoaded) {
          final results = searchState.searchMoviesModel.results;
          if (results.isEmpty) {
            return const Center(child: Text('No results found'));
          }
          return BlocBuilder<GenreCubit, GenreState>(
            builder: (context, genreState) {
              if (genreState is GenreLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (genreState is GenreFailure) {
                return Center(child: Text('Genre Error: ${genreState.message}'));
              } else if (genreState is GenreLoaded) {
                final Map<int, String> myGenreMap = {
                  for (var g in genreState.genreModel.genres) g.id: g.name
                };
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final movie = results[index];
                    return SearchListItem(
                      searchMoviesData: movie,
                      genreMap: myGenreMap,
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          );
        } else if (searchState is SearchMoviesFailure) {
          return Center(child: Text(searchState.errorMessage));
        } else if (searchState is SearchMoviesInitial) {
          return BlocBuilder<DiscoverMoviesCubit, DiscoverMoviesState>(
            builder: (context, discoverState) {
              if (discoverState is DiscoverMoviesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (discoverState is DiscoverMoviesLoaded) {
                final movies = discoverState.discoverMovies.results;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: movies.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return SearchInitialItem(movie: movie);
                    },
                  ),
                );
              } else if (discoverState is DiscoverMoviesFailure) {
                return Center(child: Text(discoverState.errorMessage));
              }
              return Container();
            },
          );
        }
        return Container();
      },
    );
  }
}
