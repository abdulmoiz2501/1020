
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/home/presentation/pages/home_page.dart';
import 'features/movie/data/repository/latest_movies_repository_impl.dart';
import 'features/movie/data/source/latest_movies_remote_source_impl.dart';
import 'features/movie/domain/usecase/discover_movies/discover_movies_usecase.dart';
import 'features/movie/presentation/cubit/discover_movies/discover_movies_cubit.dart';



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

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
            BlocProvider<DiscoverMoviesCubit>(
            create: (_) => discoverMoviesCubit,
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
