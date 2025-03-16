import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../search/presentation/cubit/search_movies_cubit.dart';
import '../cubit/discover_movies/discover_movies_cubit.dart';
import '../cubit/discover_movies/discover_movies_state.dart';
import '../cubit/watch_ui/watch_ui_cubit.dart';
import '../../../search/presentation/pages/search_page.dart';
import '../../../../core/theme/app_colors.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [

            Container(
              color: AppColors.primaryWhite,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: BlocBuilder<WatchUiCubit, int>(
            builder: (context, viewMode) {
              if (viewMode == 0) {
                return Row(
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
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        context.read<WatchUiCubit>().searchClick();
                      },
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(top: 4.0.h),
                          child: TextField(
                            onChanged: (value) {
                              if (value.length >= 2) {
                                context.read<SearchMoviesCubit>().searchMovies(query: value);
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'TV shows, movies and more',
                              border: InputBorder.none,
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: InkWell(
                                onTap: () {
                                  context.read<WatchUiCubit>().searchClose();
                                },
                                child: const Icon(Icons.close),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
            ),
            ),
            SizedBox(height: 16.h),

            BlocBuilder<WatchUiCubit, int>(
              builder: (context, viewMode) {
                return Expanded(
                  child: viewMode == 0
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
                                // Navigate to detail if needed
                              },
                              child: Container(
                                height: 180.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
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
                      : const SearchPage(),
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}
