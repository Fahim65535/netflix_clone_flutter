import 'dart:async';
import 'package:flutter/foundation.dart';

class Debounce {
  final int millisec;
  VoidCallback? action;
  Timer? _timer;

  Debounce({required this.millisec});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: millisec), action);
  }
}
