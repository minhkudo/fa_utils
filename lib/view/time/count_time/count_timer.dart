import 'package:flutter/material.dart';
import 'count_timer_controller.dart';
import 'count_timer_remaining_time.dart';

class CountTimer extends StatefulWidget {
  final CountTimerController? controller;
  final Duration begin;
  final Duration end;
  final CountTimerState initialState;
  final CountTimerInterval interval;
  final Widget Function(CountTimerState, CountTimerRemainingTime) builder;
  final bool autoStart;

  const CountTimer(
      {super.key,
      this.controller,
      required this.builder,
      required this.begin,
      required this.end,
      this.initialState = CountTimerState.reset,
      this.interval = CountTimerInterval.milliseconds,
      this.autoStart = false});

  @override
  State<CountTimer> createState() => _CountTimerState();
}

class _CountTimerState extends State<CountTimer> with SingleTickerProviderStateMixin {
  late CountTimerController _controller = widget.controller ?? CountTimerController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.initialize(
      vsync: this,
      begin: widget.begin,
      end: widget.end,
      initialState: widget.initialState,
      interval: widget.interval,
    );

    if (widget.autoStart) {
      _controller.start();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return widget.builder(_controller.state.value, _controller.remaining.value);
      },
    );
  }
}
