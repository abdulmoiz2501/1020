import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/search_movies_cubit.dart';
import '../cubit/search_movies_state.dart';
import '../widgets/search_item_list.dart';
import '../widgets/search_loading.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesLoading) {
          return const SearchLoadingShimmer();
        } else if (state is SearchMoviesLoaded) {
          final results = state.searchMoviesModel.results;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final movie = results[index];
                  return SearchListItem(searchMoviesData: movie);
                },
              ),
            ),
          );
        } else if (state is SearchMoviesFailure) {
          return Expanded(
            child: Center(child: Text(state.errorMessage)),
          );
        }
        // Default (Initial)
        return Container();
      },
    );
  }
}
