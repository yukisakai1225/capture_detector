import 'dart:async';

import 'package:flutter/services.dart';

class CaptureDetector {
  static const EventChannel _eventChannel =
      EventChannel('capture_detector/stream');
  static const MethodChannel _methodChannel = MethodChannel('capture_detector');

  static Stream<bool> get isCapturedStream =>
      _eventChannel.receiveBroadcastStream().cast();

  static Future<bool> get getIsCaptured async =>
      await _methodChannel.invokeMethod('isCaptured');
}
