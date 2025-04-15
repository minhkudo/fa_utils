import 'package:flutter/material.dart';
import 'package:last_pod_player/last_pod_player.dart';

class ComponentWatchVideoYoutube extends StatefulWidget {
  static const ROUTE_NAME = 'ComponentWatchVideoYoutube';

  final String url;

  const ComponentWatchVideoYoutube({Key? key, required this.url}) : super(key: key);

  @override
  _ComponentWatchVideoYoutubeState createState() => _ComponentWatchVideoYoutubeState();
}

class _ComponentWatchVideoYoutubeState extends State<ComponentWatchVideoYoutube> {
  late final PodPlayerController controller;
  bool isLoading = true;

  @override
  void initState() {
    loadVideo(widget.url);
    super.initState();
  }

  void loadVideo(String url) async {
    final urls = await PodPlayerController.getYoutubeUrls(
      url,
    );
    setState(() => isLoading = false);
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [360],
      ),
    )..initialise();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : PodVideoPlayer(controller: controller);
    ;
  }
}
//
// class FullscreenYoutubePlayer extends StatefulWidget {
//   final String videoId;
//   final Duration resumePosition;
//
//   const FullscreenYoutubePlayer({
//     Key? key,
//     required this.videoId,
//     required this.resumePosition,
//   }) : super(key: key);
//
//   @override
//   _FullscreenYoutubePlayerState createState() => _FullscreenYoutubePlayerState();
// }
//
// class _FullscreenYoutubePlayerState extends State<FullscreenYoutubePlayer> {
//   late YoutubePlayerController _controller;
//   bool _hasFullscreened = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//         loop: false,
//         forceHD: true,
//       ),
//     );
//
//     _controller.addListener(_onReadyAndFullscreen);
//   }
//
//   void _onReadyAndFullscreen() async {
//     if (_controller.value.isReady && !_hasFullscreened) {
//       _controller.seekTo(widget.resumePosition);
//       _hasFullscreened = true;
//       _controller.removeListener(_onReadyAndFullscreen);
//
//       // Delay nhẹ để tránh xung đột với build/layout
//       await Future.delayed(const Duration(milliseconds: 300));
//       _controller.toggleFullScreenMode();
//     }
//   }
//
//   @override
//   void dispose() {
//     final current = _controller.value.position;
//     _controller.dispose();
//     Navigator.pop(context, current);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       player:,
//       backgroundColor: Colors.black,
//       body: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//       ),
//     );
//   }
// }
