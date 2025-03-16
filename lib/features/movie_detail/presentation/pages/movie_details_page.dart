import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty/core/theme/app_assets.dart';
import '../../../../core/helpers/helper_functions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../genre/presentation/cubit/get_genre_cubit.dart';
import '../../../genre/presentation/cubit/get_genre_state.dart';
import '../../../ticket/presentation/pages/seat_selection_page.dart';
import '../../../video_feature/presentation/cubit/video_cubit.dart';
import '../../../video_feature/presentation/cubit/video_state.dart';
import '../../../video_feature/presentation/pages/youtube_video_page.dart';
import '../../data/repository/movie_details_repository_impl.dart';
import '../../data/source/movie_details_source_impl.dart';
import '../../domain/usecase/get_movie_details_usecase.dart';
import '../cubit/movie_details_cubit.dart';
import '../cubit/movie_details_state.dart';
import '../widgets/custom_button.dart';

class MovieDetailsPage extends StatelessWidget {
  final String movieId;
  final Map<int, String>? genreMap;

  const MovieDetailsPage({Key? key, required this.movieId, this.genreMap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailsCubit(
        getMovieDetailsUseCase: GetMovieDetailsUseCase(
          repository: MovieDetailsRepositoryImpl(
            remoteDataSource: MovieDetailsRemoteSourceImpl(dio: Dio()),
          ),
        ),
      )..fetchMovieDetails(movieId),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Watch",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          //centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailsLoaded) {
              final movie = state.movieDetails;
              final genreState = context.watch<GenreCubit>().state;
              final genreMap = genreState is GenreLoaded
                  ? {for (var g in genreState.genreModel.genres) g.id: g.name}
                  : {};

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 350.h,
                          width: double.infinity,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 100.h,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.0),
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                            ),
                          ),
                        ),


                        Positioned(
                          bottom: 30.h,
                          left: 20.w,
                          right: 20.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "In Theaters ${formatDate(movie.releaseDate)}",
                                style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              CustomButton(
                                text: "Get Tickets",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SeatSelectionPage(
                                        movieTitle: "The King's Man",
                                        releaseDate: formatDate(movie.releaseDate),
                                      ),
                                    ),
                                  );
                                },
                                buttonColor: AppColors.blueColor,
                                textColor: AppColors.primaryWhite,
                              ),



                              SizedBox(height: 10.h),
                              CustomButton(
                                text: "Watch Trailer",
                                onPressed: () {
                                  final videoCubit = context.read<VideoCubit>();
                                  videoCubit.fetchVideos(movieId);
                                },
                                borderColor: AppColors.blueColor,
                                textColor: AppColors.primaryWhite,
                                assetIcon: AppAssets.playIcon,
                              ),

                              BlocListener<VideoCubit, VideoState>(
                                listener: (context, state) {
                                  if (state is VideoLoaded) {
                                    final videoData = state.videos.first;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => YoutubeVideoPage(video: videoData),
                                      ),
                                    );
                                  } else if (state is VideoError) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(state.message)),
                                    );
                                  }
                                },
                                child: Container(),
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            "Genres",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),

                          Wrap(
                            spacing: 8,
                            children: movie.genres.map((genre) {
                              final genreName = genreMap[genre.id] ?? genre.name;
                              final genreColor = getGenreColor(genre.id);
                              return Chip(
                                label: Text(
                                  genreName,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                ),
                                backgroundColor: genreColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.sp),
                                ),
                              );
                            }).toList(),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Overview",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            movie.overview,
                            style: const TextStyle(fontSize: 14, color: AppColors.greyTextColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Failed to load details"));
            }
          },
        ),
      ),
    );
  }
}

