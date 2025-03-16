import 'package:dio/dio.dart';
import 'package:tentwenty/features/search/data/source/search_movies_remote_source.dart';

import '../../../../core/keys/api_keys.dart';
import '../models/search_movies_model.dart';

class SearchMoviesRemoteDataSourceImpl implements SearchMoviesRemoteDataSource {
  final Dio httpClient;

  SearchMoviesRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<SearchMoviesModel> searchMovies(String query) async {
    try {
      print("The complete api with query is ${'https://api.themoviedb.org/3/search'}/movie?query=$query&api_key=$TMDB_API_KEY");
      print("This is the query $query");
      final response = await httpClient.get(
        'https://api.themoviedb.org/3/search/movie',
        queryParameters: {
          'api_key': TMDB_API_KEY,
          'language': 'en-US',
          'query': query,
          'page': 1,
          'include_adult': false,
        },
      );


      print("Thois is the response of search movies ${response.data}");
      
      if (response.statusCode == 200) {
        return SearchMoviesModel.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.statusMessage}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
