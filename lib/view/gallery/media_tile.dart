import 'package:fa_utils/view/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';


class MediaTile extends StatelessWidget {
  final AssetEntity assetEntity;

  MediaTile({Key? key, required this.assetEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AssetEntityImage(
      assetEntity,
      isOriginal: false,
      thumbnailSize: const ThumbnailSize.square(200),
      filterQuality: FilterQuality.high,
      fit: BoxFit.cover,
      frameBuilder: (_, image, loadingBuilder, __) {
        if (loadingBuilder == null) {
          return Skeleton(height: 35, width: 35, type: 'circle');
        }
        return image;
      },
    );
  }
}
