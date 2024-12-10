import 'package:flutter/material.dart';
import 'count_timer_controller.dart';
import 'count_timer_remaining_time.dart';

class CountTimer extends StatefulWidget {
  final CountTimerController controller;
  final Duration begin;
  final Duration end;
  final CountTimerState initialState;
  final CountTimerInterval interval;
  final Widget Function(CountTimerState, CountTimerRemainingTime) builder;

  const CountTimer(
      {super.key,
      required this.controller,
      required this.builder,
      required this.begin,
      required this.end,
      this.initialState = CountTimerState.reset,
      this.interval = CountTimerInterval.milliseconds});

  @override
  State<CountTimer> createState() => _CountTimerState();
}

class _CountTimerState extends State<CountTimer> with SingleTickerProviderStateMixin {
  late CountTimerController _controller = widget.controller;

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
