import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ComponentWatchVideoNetwork extends StatefulWidget {
  static const ROUTE_NAME = 'ComponentWatchVideoNetwork';

  final String url;

  const ComponentWatchVideoNetwork({Key? key, required this.url}) : super(key: key);

  @override
  _ComponentWatchVideoNetworkState createState() => _ComponentWatchVideoNetworkState();
}

class _ComponentWatchVideoNetworkState extends State<ComponentWatchVideoNetwork> {
  static const TAG = 'ComponentWatchVideoNetwork';
  late ChewieController _chewieController;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    _videoPlayerController.initialize().then((_) => _videoPlayerController.addListener(() {
          if (_videoPlayerController.value.position >= _videoPlayerController.value.duration &&
              !_videoPlayerController.value.isPlaying) {
            // Auto reset khi kết thúc
            _videoPlayerController.seekTo(Duration.zero).then((_) => _videoPlayerController.play());
          }
        }));

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      showControls: true,
      allowFullScreen: true,
      allowMuting: true,
      showControlsOnInitialize: false,
      aspectRatio: _videoPlayerController.value.aspectRatio,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: Chewie(controller: _chewieController),
    );
  }
}
