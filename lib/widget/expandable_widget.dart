import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final List<Widget> quizItems;
  final int batchSize;
  final Widget Function(bool hasMore, VoidCallback loadMore)? customLoadMoreButtonBuilder;

  /// Nếu `true`, nút load more sẽ ẩn sau khi hiển thị hết dữ liệu
  final bool hideButtonAfterExpanded;

  const ExpandableWidget({
    super.key,
    required this.quizItems,
    this.batchSize = 3,
    this.customLoadMoreButtonBuilder,
    this.hideButtonAfterExpanded = false,
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  int visibleCount = 0;

  @override
  void initState() {
    super.initState();
    visibleCount = widget.batchSize;
  }

  void loadMore() {
    setState(() {
      visibleCount = (visibleCount + widget.batchSize).clamp(0, widget.quizItems.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasMore = visibleCount < widget.quizItems.length;

    final shouldShowButton = !widget.hideButtonAfterExpanded || hasMore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.quizItems.take(visibleCount),
        if (shouldShowButton && hasMore)
          widget.customLoadMoreButtonBuilder != null
              ? widget.customLoadMoreButtonBuilder!(hasMore, loadMore)
              : TextButton(
                  onPressed: loadMore,
                  child: const Text(
                    'Load more',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
      ],
    );
  }
}
