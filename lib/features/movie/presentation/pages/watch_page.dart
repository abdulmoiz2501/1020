// lib/features/movie/presentation/pages/watch_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../cubit/discover_movies/discover_movies_cubit.dart';
import '../cubit/discover_movies/discover_movies_state.dart';
import 'movie_categories_page.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  int _viewMode = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Text(
                    'Watch',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(_viewMode == 0 ? Icons.search : Icons.close),
                    onPressed: () {
                      setState(() {
                        _viewMode = _viewMode == 0 ? 1 : 0;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: _viewMode == 0
                  ? BlocBuilder<DiscoverMoviesCubit, DiscoverMoviesState>(
                builder: (context, state) {
                  if (state is DiscoverMoviesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DiscoverMoviesLoaded) {
                    final movies = state.discoverMovies.results;
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: movies.length,
                      separatorBuilder: (context, index) => SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            // TODO: Navigate to detail page if you want
                            // Navigator.pushNamed(context, '/movie-detail', arguments: movie.id);
                          },
                          child: Container(
                            height: 180.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 16.h,
                                  left: 16.w,
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is DiscoverMoviesFailure) {
                    return Center(child: Text(state.errorMessage));
                  }
                  return const SizedBox.shrink();
                },
              )
                  : const MoviesCategoriesPage(),
            ),
          ],
        ),
      ),
    );
  }
}
