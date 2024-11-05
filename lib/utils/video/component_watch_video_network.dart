import 'package:flutter/material.dart';

class ComponentWatchVideoNetwork extends StatefulWidget {
  static const ROUTE_NAME = 'ComponentWatchVideoNetwork';

  final String url;

  const ComponentWatchVideoNetwork({Key? key, required this.url}) : super(key: key);

  @override
  _ComponentWatchVideoNetworkState createState() => _ComponentWatchVideoNetworkState();
}

class _ComponentWatchVideoNetworkState extends State<ComponentWatchVideoNetwork> {
  static const TAG = 'ComponentWatchVideoNetwork';
  // late PodPlayerController _podPlayerController;

  @override
  void initState() {
    // _podPlayerController = PodPlayerController(
    //   playVideoFrom: PlayVideoFrom.network(
    //     widget.url,
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
    //   podProgressBarConfig: const PodProgressBarConfig(
    //     padding: EdgeInsets.only(
    //       bottom: 20,
    //       left: 20,
    //       right: 20,
    //     ),
    //     playingBarColor: Colors.blue,
    //     circleHandlerColor: Colors.blue,
    //     backgroundColor: Colors.blueGrey,
    //   ),
    // );
  }
}
