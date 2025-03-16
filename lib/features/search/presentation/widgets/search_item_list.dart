import 'package:flutter/material.dart';
import '../../data/models/search_movies_data.dart';

class SearchListItem extends StatelessWidget {
  final SearchMoviesData searchMoviesData;
  const SearchListItem({Key? key, required this.searchMoviesData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to details, if desired
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          image: searchMoviesData.backdropPath != null
              ? DecorationImage(
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${searchMoviesData.backdropPath}',
            ),
            fit: BoxFit.cover,
          )
              : null,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                searchMoviesData.title ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
