import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  static final instance = Debouncer._();

  Debouncer._();

  factory Debouncer() => instance;
  int milliseconds = 500;
  VoidCallback? action;
  Timer? _timer;

  run(VoidCallback action, {int milliseconds = 500}) {
    this.milliseconds = milliseconds;
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: this.milliseconds), action);
  }
}
