# capture_detector

Flutter plugin that allows you to detect iOS screen capture.

## Usage
### Import the package
To use this plugin, follow the [**plugin installation instructions**](https://pub.dev/packages/capture_detector#-installing-tab-).

### Use the plugin
Add the following import to your Dart code:
```dart
import 'package:capture_detector/capture_detector.dart';
```

There are two way to get state of screen captured.

##### Subscription
```dart
CaptureDetector.isCapturedStream.listen((event) => print(event));
```

##### Once
```dart
CaptureDetector.getIsCaptured.then((val) => print(val));
```

## Issues and Feedback
Please [**file**](https://github.com/yukisakai1225/capture_detector/issues/new) issues to send feedback or report a bug. Thank you !

## Author
- [Sakai Yuki](https://github.com/yukisakai1225) • <yukisakai1225@gmail.com>

## License

MIT