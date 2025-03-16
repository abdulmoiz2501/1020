
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/genre/data/repository/genre_repository_impl.dart';
import 'features/genre/data/source/genre_remote_source_impl.dart';
import 'features/genre/domain/usecase/get_genre_usecase.dart';
import 'features/genre/presentation/cubit/get_genre_cubit.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/movie/data/repository/latest_movies_repository_impl.dart';
import 'features/movie/data/source/latest_movies_remote_source_impl.dart';
import 'features/movie/domain/usecase/discover_movies/discover_movies_usecase.dart';
import 'features/movie/presentation/cubit/discover_movies/discover_movies_cubit.dart';
import 'features/movie/presentation/cubit/watch_ui/watch_ui_cubit.dart';
import 'features/search/data/repository/search_movies_repository_impl.dart';
import 'features/search/data/source/search_movies_data_source_impl.dart';
import 'features/search/domain/usecase/search_movies_usecase.dart';
import 'features/search/presentation/cubit/search_movies_cubit.dart';
import 'features/search/presentation/cubit/search_ui_cubit.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final latestMoviesRemoteDataSource = LatestMoviesRemoteDataSourceImpl(dio: dio);
    final latestMovieRepository = LatestMoviesRepositoryImpl(remoteDataSource: latestMoviesRemoteDataSource,);
    final discoverMoviesUseCase = DiscoverMoviesUseCase(repository: latestMovieRepository,);
    final discoverMoviesCubit = DiscoverMoviesCubit(discoverMoviesUseCase: discoverMoviesUseCase,)..fetchDiscoverMovies();
    final searchMoviesRemoteDataSource = SearchMoviesRemoteDataSourceImpl(httpClient: dio);
    final searchMoviesRepository = SearchMoviesRepositoryImpl(remoteDataSource: searchMoviesRemoteDataSource,);
    final searchMoviesUseCase = SearchMoviesUseCase(repository: searchMoviesRepository,);

    final genreRemoteDataSource = GenreRemoteDataSourceImpl(dio: dio);
    final genreRepository = GenreRepositoryImpl(remoteDataSource: genreRemoteDataSource);
    final getGenresUseCase = GetGenresUseCase(repository: genreRepository);



    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<DiscoverMoviesCubit>(
              create: (_) => discoverMoviesCubit,
            ),
            BlocProvider<WatchUiCubit>(
              create: (_) => WatchUiCubit(),
            ),
            BlocProvider<SearchMoviesCubit>(
              create: (_) => SearchMoviesCubit(
                searchMoviesUseCase: searchMoviesUseCase,
              ),
            ),
            BlocProvider<GenreCubit>(
              create: (_) => GenreCubit(getGenresUseCase: getGenresUseCase)
                ..fetchGenres(),
            ),
            BlocProvider<SearchUiCubit>(
              create: (_) => SearchUiCubit(),
            ),
          ],

          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
