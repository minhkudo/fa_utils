// import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
class VideoWidget extends StatefulWidget {
  final String url;

  VideoWidget({required this.url});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}
//
class _VideoWidgetState extends State<VideoWidget> {
//   late CustomVideoPlayerController _customVideoPlayerController;
//   late YoutubePlayerController _youtubeController;
//
//   bool _isYouTube = false;
//   bool _isMP4 = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     if (widget.url.contains("youtube.com") || widget.url.contains("youtu.be")) {
//       _isYouTube = true;
//       _initializeYouTubePlayer();
//     } else if (widget.url.contains(".mp4")) {
//       _isMP4 = true;
//       _initializeMP4Player();
//     }
//   }
//
//   // Khởi tạo YouTube Player
//   void _initializeYouTubePlayer() {
//     final videoId = YoutubePlayer.convertUrlToId(widget.url);
//     _youtubeController = YoutubePlayerController(
//       initialVideoId: videoId!,
//       flags: const YoutubePlayerFlags(
//         autoPlay: false,
//         mute: false,
//       ),
//     );
//   }
//
//   // Khởi tạo MP4 Player
//   void _initializeMP4Player() {
//     CachedVideoPlayerController videoController = CachedVideoPlayerController.network(widget.url)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//
//     _customVideoPlayerController =
//         CustomVideoPlayerController(context: context, videoPlayerController: videoController);
//   }
//
//   @override
//   void dispose() {
//     if (_isYouTube) {
//       _youtubeController.dispose();
//     } else if (_isMP4) {
//       _customVideoPlayerController.dispose();
//     }
//     super.dispose();
//   }
//
  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // if (_isYouTube) {
    //   return YoutubePlayer(
    //     controller: _youtubeController,
    //     liveUIColor: Colors.red,
    //   );
    // } else if (_isMP4) {
    //   return CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController);
    // } else {
    //   return const Center(child: Text("Không nhận diện được loại video."));
    // }
  }
}
