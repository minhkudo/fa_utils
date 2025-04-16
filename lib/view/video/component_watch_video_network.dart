import 'package:flutter/material.dart';
import 'package:last_pod_player/last_pod_player.dart';

class ComponentWatchVideoNetwork extends StatefulWidget {
  static const ROUTE_NAME = 'ComponentWatchVideoNetwork';

  final String url;

  const ComponentWatchVideoNetwork({super.key, required this.url});

  @override
  _ComponentWatchVideoNetworkState createState() => _ComponentWatchVideoNetworkState();
}

class _ComponentWatchVideoNetworkState extends State<ComponentWatchVideoNetwork> {
  static const TAG = 'ComponentWatchVideoNetwork';
  late final PodPlayerController controller;
  bool isLoading = true;

  @override
  void initState() {
    loadVideo(widget.url);
    super.initState();
  }

  void loadVideo(String url) async {
    setState(() => isLoading = false);
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(url),
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
  }
}
