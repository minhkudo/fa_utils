import 'package:better_player_plus/better_player_plus.dart';
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
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        widget.url,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(controller: _betterPlayerController),
    );
  }
}
