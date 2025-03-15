import 'package:dio/dio.dart';
import '../../../../core/exception/server_exception.dart';
import '../../../../core/keys/api_keys.dart';
import '../models/genre_model.dart';
import '../models/movie_details_model.dart';
import '../models/upcoming_movies_model.dart';
import 'latest_movies_remote_source.dart';

class LatestMoviesRemoteDataSourceImpl implements LatestMoviesRemoteDataSource {
  final Dio dio;

  LatestMoviesRemoteDataSourceImpl({required this.dio});

  @override
  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    try {
      final response = await dio.get(
        '${TMDB_BASE_URL}movie/upcoming',
        queryParameters: {
          'api_key': TMDB_API_KEY,
          'language': 'en-US',
          'page': 1,
        },
      );

      if (response.statusCode == 200) {
        return UpcomingMoviesModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'Error: ${response.statusMessage}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<GenreModel> getGenre() async {
    try {
      final response = await dio.get(
        '${TMDB_BASE_URL}genre/movie/list',
        queryParameters: {
          'api_key': TMDB_API_KEY,
        },
      );

      if (response.statusCode == 200) {
        return GenreModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'Error: ${response.statusMessage}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(String movieId) async {
    try {
      final response = await dio.get(
        '${TMDB_BASE_URL}movie/$movieId',
        queryParameters: {
          'api_key': TMDB_API_KEY,
        },
      );

      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'Error: ${response.statusMessage}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
