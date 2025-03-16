import '../models/video_model.dart';

abstract class VideoRemoteSource {
  Future<List<VideoModel>> fetchVideos(String movieId);
}
