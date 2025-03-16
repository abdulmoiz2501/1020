import '../../data/models/video_model.dart';
import '../../domain/repository/video_repository.dart';

class GetVideoUseCase {
  final VideoRepository repository;

  GetVideoUseCase({required this.repository});

  Future<List<VideoModel>> call(String movieId) async {
    return await repository.getVideos(movieId);
  }
}
