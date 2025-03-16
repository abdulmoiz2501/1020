import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../data/models/video_model.dart';

class YoutubeVideoPage extends StatefulWidget {
  final VideoModel video;

  const YoutubeVideoPage({Key? key, required this.video}) : super(key: key);

  @override
  _YoutubeVideoPageState createState() => _YoutubeVideoPageState();
}

class _YoutubeVideoPageState extends State<YoutubeVideoPage> {
  late YoutubePlayerController _youtubePlayerController;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();

    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.video.key,
      flags: const YoutubePlayerFlags(autoPlay: true),
    )..addListener(_videoListener);
  }

  /// **✅ Detect when the video ends and close the player**
  void _videoListener() {
    if (_isPlayerReady && mounted) {
      final playerState = _youtubePlayerController.value.playerState;

      if (playerState == PlayerState.ended) {
        /// **🚀 Close the video player automatically**
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.pop(context);
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _youtubePlayerController.removeListener(_videoListener);
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: YoutubePlayer(
        controller: _youtubePlayerController,
        showVideoProgressIndicator: true,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
    );
  }
}
