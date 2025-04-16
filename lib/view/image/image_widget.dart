import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final String? semanticsLabel;
  final Color? color;
  final double height;
  final double width;
  final BoxFit? fit;
  final Alignment? alignment;
  final EdgeInsets? padding;
  final WidgetBuilder? placeholderBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;

  // Optional visual features
  final bool useFadeIn;
  final double borderRadius;
  final bool isCircle;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.height = 20,
    this.width = 20,
    this.color,
    this.fit = BoxFit.contain,
    this.semanticsLabel,
    this.padding = const EdgeInsets.all(0),
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.errorWidget,
    this.useFadeIn = false,
    this.borderRadius = 0,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = _buildImage(context);
    final padded = Padding(padding: padding ?? EdgeInsets.zero, child: content);

    if (isCircle) {
      return ClipOval(child: padded);
    } else if (borderRadius > 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: padded,
      );
    } else {
      return padded;
    }
  }

  Widget _buildImage(BuildContext context) {
    if (imageUrl.startsWith("http")) {
      if (imageUrl.contains(".svg")) {
        return SvgPicture.network(
          imageUrl,
          width: width,
          height: height,
          color: color,
          semanticsLabel: semanticsLabel,
          placeholderBuilder: placeholderBuilder ?? _buildPlaceholder,
        );
      } else {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          color: color,
          placeholder: (context, url) =>
          placeholderBuilder?.call(context) ?? _buildPlaceholder(context),
          errorWidget: errorWidget ?? _buildErrorWidget,
          fadeInDuration: useFadeIn ? const Duration(milliseconds: 300) : Duration.zero,
        );
      }
    } else {
      if (imageUrl.endsWith(".svg")) {
        return SvgPicture.asset(
          imageUrl,
          width: width,
          height: height,
          color: color,
          fit: fit ?? BoxFit.contain,
          semanticsLabel: semanticsLabel,
          placeholderBuilder: placeholderBuilder ?? _buildPlaceholder,
        );
      } else {
        return Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          color: color,
          semanticLabel: semanticsLabel,
        );
      }
    }
  }

  Widget _buildPlaceholder(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorWidget(BuildContext context, String url, dynamic error) {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(child: Icon(Icons.error)),
    );
  }
}
