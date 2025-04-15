import 'package:fa_utils/view/video/component_watch_video_network.dart';
import 'package:fa_utils/view/video/component_watch_video_youtube.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final String url;

  const VideoWidget({super.key, required this.url});

  bool isYoutubeUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    return uri.host.contains('youtube.com') || uri.host.contains('youtu.be');
  }

  bool isMp4Url(String url) {
    final uri = Uri.tryParse(url);
    return uri?.path.toLowerCase().endsWith(".mp4") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    if (isYoutubeUrl(url)) {
      return ComponentWatchVideoYoutube(url: url);
    } else if (isMp4Url(url)) {
      return ComponentWatchVideoNetwork(url: url);
    } else {
      return SizedBox();
    }
  }
}
