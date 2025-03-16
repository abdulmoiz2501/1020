import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../genre/presentation/cubit/get_genre_cubit.dart';
import '../../../movie_detail/presentation/pages/movie_details_page.dart';
import '../../data/models/search_movies_data.dart';

class SearchListItem extends StatelessWidget {
  final SearchMoviesData searchMoviesData;
  final Map<int, String>? genreMap;

  const SearchListItem({
    Key? key,
    required this.searchMoviesData,
    this.genreMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genreString = _buildGenreString(searchMoviesData.genreIds, genreMap);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: context.read<GenreCubit>(),
                    child: MovieDetailsPage(movieId: searchMoviesData.id.toString()),
                  ),
                ),
              );
              print("Searched one pressed");
        },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: (searchMoviesData.backdropPath == null ||
                  searchMoviesData.backdropPath!.isEmpty)
                  ? Container(
                width: 130.w,
                height: 100.h,
                color: Colors.grey,
                child: const Center(
                  child: Icon(Icons.image, color: Colors.white),
                ),
              )
                  : Image.network(
                'https://image.tmdb.org/t/p/w500${searchMoviesData.backdropPath}',
                width: 130.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  searchMoviesData.title ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  genreString,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.darkgreyColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz, color: AppColors.blueColor),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }

  String _buildGenreString(List<int>? genreIds, Map<int, String>? genreMap) {
    if (genreIds == null || genreIds.isEmpty || genreMap == null) return '';
    return genreIds
        .map((id) => genreMap[id] ?? '')
        .where((g) => g.isNotEmpty)
        .join(', ');
  }
}
