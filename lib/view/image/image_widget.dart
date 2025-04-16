import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatefulWidget {
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

  const ImageWidget({
    Key? key,
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
  }) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl.startsWith("http")) {
      //web and image not coming from firebase
      // if (Application.isWeb() && !widget.imageUrl.contains("firebase")) {
      //   ui.platformViewRegistry.registerViewFactory(
      //       widget.imageUrl,
      //       (int viewId) => ImageElement()
      //         ..src = widget.imageUrl
      //         ..style?.width = '100%' //or '0%'-'100%'
      //         ..style?.height = '100%');
      //   return SizedBox(width: widget.width, height: widget.height, child: HtmlElementView(viewType: widget.imageUrl));
      // } else {
      return widget.imageUrl.contains('.svg')
          ? Padding(
              padding: widget.padding!,
              child: SvgPicture.network(widget.imageUrl,
                  width: widget.width,
                  height: widget.height,
                  color: widget.color,
                  semanticsLabel: widget.semanticsLabel,
                  placeholderBuilder: widget.placeholderBuilder ?? buildPlaceholder),
            )
          : Padding(
              padding: widget.padding!,
              child: CachedNetworkImage(
                width: widget.width,
                height: widget.height,
                imageUrl: widget.imageUrl,
                placeholder: (context, url) {
                  if (widget.placeholderBuilder != null) {
                    return widget.placeholderBuilder!(context);
                  } else {
                    return buildPlaceholder(context, url: url);
                  }
                },
                errorWidget: widget.errorWidget ?? buildErrorWidget,
                fit: widget.fit,
                color: widget.color,
              ),
            );
      // }
    } else {
      // Local file path
      if (widget.imageUrl.endsWith(".svg")) {
        // SVG image
        return Padding(
          padding: widget.padding!,
          child: SvgPicture.asset(
            widget.imageUrl,
            width: widget.width,
            height: widget.height,
            color: widget.color,
            placeholderBuilder: widget.placeholderBuilder ?? buildPlaceholder,
            fit: widget.fit ?? BoxFit.contain,
            semanticsLabel: widget.semanticsLabel,
          ),
        );
      } else {
        // Other image formats (PNG, JPEG, etc.)
        return Padding(
          padding: widget.padding!,
          child: Image.asset(
            widget.imageUrl,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            color: widget.color,
            semanticLabel: widget.semanticsLabel,
          ),
        );
      }
    }
  }

  Widget buildErrorWidget(BuildContext context, String url, dynamic error) {
    return Container(
      height: widget.width,
      width: widget.height,
      alignment: Alignment.center,
      child: const Icon(Icons.error),
    );
  }

  Widget buildPlaceholder(BuildContext context, {String? url}) {
    return Container(
      height: widget.width,
      width: widget.height,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
