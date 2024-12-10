import 'package:fa_utils/view/time/count_timer.dart';
import 'package:flutter/material.dart';

import 'count_timer_remaining_time.dart';

/// State for CustomTimer.
enum CountTimerState { reset, paused, counting, finished }

// Update interval for CustomTimer.
enum CountTimerInterval { minutes, seconds, milliseconds }

class CountTimerController extends ChangeNotifier {
  /// The [TickerProvider] for the current context.
  final TickerProvider vsync;

  /// The start of the timer.
  late Duration _begin;

  Duration get begin => _begin;

  set begin(Duration duration) {
    final prev = remaining.value.duration;
    _begin = duration;
    _init();
    jumpTo(prev);
  }

  /// The end of the timer.
  late Duration _end;

  Duration get end => _end;

  set end(Duration duration) {
    final prev = remaining.value.duration;
    _end = duration;
    _init();
    jumpTo(prev);
  }

  /// Defines the initial state of the timer. By default it is `CountTimerState.reset`.
  final CountTimerState initialState;

  /// The update interval of the timer. By default it is `CustomTimerUpdateInterval.milliseconds`.
  CountTimerInterval interval;

  late AnimationController _animationController;
  late Animation<int> _animation;

  late ValueNotifier<CountTimerState> _state =
      ValueNotifier(initialState != CountTimerState.paused ? initialState : CountTimerState.reset);

  late ValueNotifier<CountTimerRemainingTime> _remaining =
      ValueNotifier(CountTimerRemainingTime(duration: initialState == CountTimerState.finished ? end : begin));

  /// Current state of the timer.
  ValueNotifier<CountTimerState> get state => _state;

  /// Current remaining time.
  ValueNotifier<CountTimerRemainingTime> get remaining => _remaining;

  /// Controls the state of the timer.
  /// Allows you to execute the `start()`, `pause()`, `reset()` and `finish()` functions. It also allows you to get or subscribe to the current `state` and `remaining` time.
  /// Remember to dispose when you are no longer using it.
  CountTimerController({
    required this.vsync,
    required Duration begin,
    required Duration end,
    this.initialState = CountTimerState.reset,
    this.interval = CountTimerInterval.milliseconds,
  }) {
    _begin = begin;
    _end = end;
    _animationController = AnimationController(vsync: vsync);
    _init();

    if (initialState == CountTimerState.finished)
      finish();
    else if (initialState == CountTimerState.counting) start();

    _animation.addListener(_listener);
    _animation.addStatusListener(_statusListener);
  }

  void _init() {
    _animationController.duration = Duration(milliseconds: (begin - end).inMilliseconds.abs());

    final curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animation = IntTween(begin: begin.inMilliseconds, end: end.inMilliseconds).animate(curvedAnimation);
  }

  void _listener() {
    final duration = Duration(milliseconds: _animation.value);
    final next = CountTimerRemainingTime(duration: duration);

    bool update = false;
    if (interval == CountTimerInterval.milliseconds)
      update = true;
    else if (next.seconds != remaining.value.seconds && interval == CountTimerInterval.seconds)
      update = true;
    else if (next.minutes != remaining.value.minutes && interval == CountTimerInterval.minutes) update = true;

    if (update) {
      _remaining.value = next;
      notifyListeners();
    }
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _state.value = CountTimerState.finished;
      notifyListeners();
    }
  }

  /// Timer reset function.
  void reset() {
    _animationController.reset();
    _state.value = CountTimerState.reset;
    notifyListeners();
  }

  /// Timer start function.
  void start() {
    if (state.value == CountTimerState.finished) _animationController.reset();
    _animationController.forward();

    _state.value = CountTimerState.counting;
    notifyListeners();
  }

  void _pause() {
    _animationController.stop();
    _state.value = CountTimerState.paused;
    notifyListeners();
  }

  /// Timer pause function.
  void pause() {
    if (state.value != CountTimerState.counting) return;
    _pause();
  }

  /// Timer finish function.
  void finish() {
    _animationController.stop();
    _animationController.value = 1.0;
    _state.value = CountTimerState.finished;
    notifyListeners();
  }

  /// Function to move the current time.
  void jumpTo(Duration duration) {
    final isCountUp = begin < end;

    final a = isCountUp ? begin.inMilliseconds : end.inMilliseconds;
    final b = isCountUp ? end.inMilliseconds : begin.inMilliseconds;

    final value = (duration.inMilliseconds - a) / (b - a);
    final next = isCountUp ? value : 1.0 - value;

    if (next <= 0.0 && state.value != CountTimerState.counting) return reset();
    if (next >= 1.0) return finish();

    _animationController.value = next;
    if (state.value == CountTimerState.counting)
      start();
    else
      _pause();
  }

  /// Function to increase the remaining time.
  void add(Duration duration) {
    jumpTo(_remaining.value.duration + duration);
  }

  /// Function to decrease the remaining time.
  void subtract(Duration duration) {
    jumpTo(_remaining.value.duration - duration);
  }

  @override
  void dispose() {
    _animation.removeListener(_listener);
    _animation.removeStatusListener(_statusListener);
    _animationController.dispose();
    super.dispose();
  }
}
