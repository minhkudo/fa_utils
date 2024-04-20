import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

typedef ImageBuilder = Function(BuildContext context, ImageProvider<Object> imageProvider);
typedef ImageError = Widget Function(BuildContext context, String url, dynamic error);

class CacheImage extends StatelessWidget {
  final String imageUrl;
  final ImageBuilder? imageBuilder;
  final ImageError? imageError;

  const CacheImage({Key? key, required this.imageUrl, this.imageBuilder, this.imageError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheManager: CacheManager(
        Config(
          'cacheImageNetwork',
          stalePeriod: const Duration(days: 5),
          maxNrOfCacheObjects: 500,
        ),
      ),
      errorWidget: (context, url, error) => (imageError != null)
          ? imageError!(context, url, error)
          : Image(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover, // use this
          ),
      imageBuilder: (context, imageProvider) => (imageBuilder != null)
          ? imageBuilder!(context, imageProvider)
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: imageProvider,
              fit: BoxFit.cover, // use this
            ),
          ),
    );
  }
}
