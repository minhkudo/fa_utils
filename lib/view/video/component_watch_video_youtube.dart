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
        autoPlay: false,
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
  }
}
