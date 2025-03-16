import 'package:dio/dio.dart';
import 'package:tentwenty/core/keys/api_keys.dart';

import '../models/movie_detail_model.dart';
import 'movie_details_source.dart';


class MovieDetailsRemoteSourceImpl implements MovieDetailsRemoteSource {
  final Dio dio;

  MovieDetailsRemoteSourceImpl({required this.dio});

  @override
  Future<MovieDetailsModel> getMovieDetails(String movieId) async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/$movieId',
      queryParameters: {'api_key': TMDB_API_KEY},
    );

    print("The api respone of movie details is ${response.data}");
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load movie details");
    }
  }
}
