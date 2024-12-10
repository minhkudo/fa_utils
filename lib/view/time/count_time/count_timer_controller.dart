import 'package:flutter/material.dart';
import 'count_timer_remaining_time.dart';

enum CountTimerState { reset, paused, counting, finished }
enum CountTimerInterval { minutes, seconds, milliseconds }

class CountTimerController extends ChangeNotifier {
  late TickerProvider vsync;

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
  late CountTimerState initialState;

  /// The update interval of the timer. By default it is `CustomTimerUpdateInterval.milliseconds`.
  late CountTimerInterval interval;

  late AnimationController _animationController;
  late Animation<int> _animation;

  late ValueNotifier<CountTimerState> _state;
  late ValueNotifier<CountTimerRemainingTime> _remaining;

  /// Current state of the timer.
  ValueNotifier<CountTimerState> get state => _state;

  /// Current remaining time.
  ValueNotifier<CountTimerRemainingTime> get remaining => _remaining;

  /// Initialize the timer with required parameters.
  void initialize({
    required TickerProvider vsync,
    required Duration begin,
    required Duration end,
    CountTimerState initialState = CountTimerState.reset,
    CountTimerInterval interval = CountTimerInterval.milliseconds,
  }) {
    // Khởi tạo vsync
    this.vsync = vsync;

    // Khởi tạo các giá trị còn lại
    _begin = begin;
    _end = end;
    this.initialState = initialState;
    this.interval = interval;

    // Khởi tạo AnimationController
    _animationController = AnimationController(vsync: vsync);
    _init();

    // Khởi tạo _state và _remaining
    _state = ValueNotifier(initialState != CountTimerState.paused ? initialState : CountTimerState.reset);
    _remaining = ValueNotifier(CountTimerRemainingTime(duration: initialState == CountTimerState.finished ? _end : _begin));

    if (initialState == CountTimerState.finished) {
      finish();
    } else if (initialState == CountTimerState.counting) {
      start();
    }

    _animation.addListener(_listener);
    _animation.addStatusListener(_statusListener);
  }

  void _init() {
    // Khởi tạo AnimationController với thời gian (duration)
    _animationController.duration = Duration(milliseconds: (_begin - _end).inMilliseconds.abs());
    final curvedAnimation = CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _animation = IntTween(begin: _begin.inMilliseconds, end: _end.inMilliseconds).animate(curvedAnimation);
  }

  void _listener() {
    final duration = Duration(milliseconds: _animation.value);
    final next = CountTimerRemainingTime(duration: duration);

    bool update = false;
    if (interval == CountTimerInterval.milliseconds)
      update = true;
    else if (next.seconds != remaining.value.seconds && interval == CountTimerInterval.seconds)
      update = true;
    else if (next.minutes != remaining.value.minutes && interval == CountTimerInterval.minutes)
      update = true;

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
    final isCountUp = _begin < _end;

    final a = isCountUp ? _begin.inMilliseconds : _end.inMilliseconds;
    final b = isCountUp ? _end.inMilliseconds : _begin.inMilliseconds;

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
