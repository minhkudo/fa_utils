import 'package:flutter/material.dart';

class ComponentWatchVideoYoutube extends StatefulWidget {
  static const ROUTE_NAME = 'ComponentWatchVideoYoutube';

  final String url;
  final double frameAspectRatio;
  final bool autoPlay;

  const ComponentWatchVideoYoutube({Key? key, required this.url, this.frameAspectRatio = 16 / 9, this.autoPlay = false}) : super(key: key);

  @override
  _ComponentWatchVideoYoutubeState createState() => _ComponentWatchVideoYoutubeState();
}

class _ComponentWatchVideoYoutubeState extends State<ComponentWatchVideoYoutube> {
  static const TAG = 'ComponentWatchVideoYoutube';
  // late PodPlayerController _podPlayerController;

  @override
  void initState() {
    // _podPlayerController = PodPlayerController(
    //   playVideoFrom: PlayVideoFrom.youtube(widget.url),
    //   podPlayerConfig: PodPlayerConfig(
    //     autoPlay: widget.autoPlay,
    //   ),
    // )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _podPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return PodVideoPlayer(
    //   controller: _podPlayerController,
    //   frameAspectRatio: widget.frameAspectRatio,
    // );
  }
}
