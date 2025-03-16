import 'package:dio/dio.dart';
import '../../../../core/exception/server_exception.dart';
import '../../../../core/keys/api_keys.dart';
import '../models/upcoming_movies_model.dart';
import 'latest_movies_remote_source.dart';

class LatestMoviesRemoteDataSourceImpl implements LatestMoviesRemoteDataSource {
  final Dio dio;

  LatestMoviesRemoteDataSourceImpl({required this.dio});


  @override
  Future<UpcomingMoviesModel> getDiscoverMovies() async {
    try {
      final response = await dio.get(
        '${TMDB_BASE_URL}discover/movie',
        queryParameters: {
          'api_key': TMDB_API_KEY,
          'include_adult': 'false',
          'include_video': 'false',
          'language': 'en-US',
          'page': '1',
          'sort_by': 'popularity.desc',
          'with_release_type': '2|3',
        },
      );
      print("API Stats of discover movies is: ${response.statusCode}");
      print("API Response of discover movies is: ${response.data}");

      if (response.statusCode == 200) {
        return UpcomingMoviesModel.fromJson(response.data);
      } else {
        throw ServerException(message: 'Error: ${response.statusMessage}');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }


}
