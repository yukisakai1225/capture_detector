import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:capture_detector/capture_detector.dart';

void main() {
  const MethodChannel channel = MethodChannel('capture_detector');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await CaptureDetector.platformVersion, '42');
  });
}
