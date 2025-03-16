import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../movie/data/models/upcoming_movies_model.dart';


class SearchInitialItem extends StatelessWidget {
  final MovieItem movie;
  const SearchInitialItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        image: movie.posterPath != null
            ? DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          ),
          fit: BoxFit.fitWidth,
        )
            : null,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 8,
            right: 8,
            child: Text(
              movie.title,
              style:  TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
