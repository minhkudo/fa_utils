import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<T> runTask<T>(Future<T> task, {Stream<double>? percent}) async {
    var overlayEntry = OverlayEntry(builder: (context) => PageLoadingOverlay(percent: percent));
    Overlay.of(this).insert(overlayEntry);
    try {
      final data = await task;
      overlayEntry.remove();
      return data;
    } catch (error) {
      overlayEntry.remove();
      rethrow;
    }
  }
}

class PageLoadingOverlay extends StatefulWidget {
  static const ROUTE_NAME = 'PageLoadingOverlay';

  final Stream<double>? percent;

  PageLoadingOverlay({this.percent});

  @override
  _PageLoadingOverlayState createState() => _PageLoadingOverlayState();
}

class _PageLoadingOverlayState extends State<PageLoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    // developer.log('widget.percent: ${widget.percent}',
    //     name: '_PageLoadingOverlayState');
    return Container(
        alignment: Alignment.center,
        color: Colors.black26,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
              width: 80,
              height: 80,
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.center,
              child: widget.percent == null
                  ? CupertinoActivityIndicator()
                  : StreamBuilder<double>(
                      stream: widget.percent,
                      builder: (context, snap) {
                        return Container(
                          width: 56,
                          height: 56,
                          child: LoadingPercentWidget(((snap.data ?? 0) * 100).toInt()),
                        );
                      }),
            ),
          ),
        ));
  }
}

class LoadingPercentWidget extends StatelessWidget {
  final int percent;

  LoadingPercentWidget(this.percent);

  @override
  Widget build(BuildContext context) {
    developer.log('percent $percent', name: 'LoadingPercentWidget');
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            value: percent / 100,
            backgroundColor: Colors.white,
            color: Colors.blue,
          )),
          Text(
            '$percent%',
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Colors.blue,
                ),
          )
        ],
      ),
    );
  }
}
