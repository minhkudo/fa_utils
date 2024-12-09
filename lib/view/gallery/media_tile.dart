import 'package:fa_utils/view/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaTile extends StatelessWidget {
  final AssetEntity assetEntity;

  MediaTile({Key? key, required this.assetEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetEntityImageProvider(
        assetEntity,
        isOriginal: false,
        thumbnailSize: const ThumbnailSize.square(200),
      ),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      frameBuilder: (_, image, loadingBuilder, __) {
        if (loadingBuilder == null) {
          return Skeleton(height: 35, width: 35, type: 'circle');
        }
        return image;
      },
    );
  }
}
