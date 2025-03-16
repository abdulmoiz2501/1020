import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_video_usecase.dart';
import 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final GetVideoUseCase getVideoUseCase;

  VideoCubit({required this.getVideoUseCase}) : super(VideoInitial());

  Future<void> fetchVideos(String movieId) async {
    emit(VideoLoading());
    try {
      final videos = await getVideoUseCase(movieId);
      if (videos.isNotEmpty) {
        emit(VideoLoaded(videos));
      } else {
        emit(VideoError("No trailer available"));
      }
    } catch (e) {
      emit(VideoError("Failed to load videos"));
    }
  }
}
