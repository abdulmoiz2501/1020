import '../../domain/repository/video_repository.dart';
import '../models/video_model.dart';
import '../source/video_source.dart';

class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteSource remoteSource;

  VideoRepositoryImpl({required this.remoteSource});

  @override
  Future<List<VideoModel>> getVideos(String movieId) async {
    return await remoteSource.fetchVideos(movieId);
  }
}
