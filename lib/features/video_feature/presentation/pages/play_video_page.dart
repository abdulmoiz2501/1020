import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/video_cubit.dart';
import '../cubit/video_state.dart';
import 'youtube_video_page.dart';

class PlayVideoPage extends StatelessWidget {
  final String movieId;

  const PlayVideoPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Trailer")),
      body: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          if (state is VideoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is VideoLoaded) {
            return state.videos.isNotEmpty
                ? YoutubeVideoPage(video: state.videos.first)
                : const Center(child: Text("No Trailer Available"));

          } else if (state is VideoError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
