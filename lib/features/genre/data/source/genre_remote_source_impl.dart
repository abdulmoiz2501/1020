import 'package:dio/dio.dart';
import '../../../../core/exception/server_exception.dart';
import '../../../../core/keys/api_keys.dart';
import '../models/genre_model.dart';
import 'genre_remote_source.dart';

class GenreRemoteDataSourceImpl implements GenreRemoteDataSource {
  final Dio dio;

  GenreRemoteDataSourceImpl({required this.dio});

  @override
  Future<GenreModel> getGenres() async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/genre/movie/list',
        queryParameters: {
          'api_key': TMDB_API_KEY,
          'language': 'en-US',
        },
      );

      print("The response ofgenre api is: ${response.data}");

      if (response.statusCode == 200) {
        return GenreModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'Error: ${response.statusMessage}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
