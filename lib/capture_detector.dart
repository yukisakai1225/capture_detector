import 'dart:async';

import 'package:flutter/services.dart';

class CaptureDetector {
  static const EventChannel _eventChannel = EventChannel('capture_detector');

  static Stream<bool> get isCapturedStream =>
      _eventChannel.receiveBroadcastStream().cast();
}
