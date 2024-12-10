import 'package:flutter/material.dart';
import 'count_timer_controller.dart';
import 'count_timer_remaining_time.dart';

class CountTimer extends StatefulWidget {
  final CountTimerController controller;

  /// Returns a `CustomTimerState` to get the current state of the timer, which can be `reset`, `counting`, `paused`, or `finished`.
  /// It also returns a `CustomTimerRemainingTime` to get the remaining `days`, `hours`, `minutes`, `seconds` and `milliseconds`.
  final Widget Function(CountTimerState, CountTimerRemainingTime) builder;

  const CountTimer({super.key, required this.controller, required this.builder});

  @override
  State<CountTimer> createState() => _CountTimerState();
}

class _CountTimerState extends State<CountTimer> {
  late CountTimerController _controller = widget.controller;

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
