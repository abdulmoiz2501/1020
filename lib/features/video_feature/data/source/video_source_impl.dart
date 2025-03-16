import 'package:dio/dio.dart';
import 'package:tentwenty/core/keys/api_keys.dart';
import 'package:tentwenty/features/video_feature/data/source/video_source.dart';
import '../models/video_model.dart';

class VideoRemoteSourceImpl implements VideoRemoteSource {
  final Dio dio;

  VideoRemoteSourceImpl({required this.dio});

  @override
  Future<List<VideoModel>> fetchVideos(String movieId) async {
    final response = await dio.get(
      "https://api.themoviedb.org/3/movie/$movieId/videos",
      queryParameters: {"api_key": TMDB_API_KEY},
    );

    print("The response of video is ${response.data}");
    if (response.statusCode == 200) {
      return List<VideoModel>.from(
          response.data["results"].map((x) => VideoModel.fromJson(x)));
    } else {
      throw Exception("Failed to load video");
    }
  }
}
