import 'package:capture_detector/capture_detector.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: StreamBuilder(
              stream: CaptureDetector.isCapturedStream,
              builder: (context, snapshot) {
                return Text('isCaptured: ${snapshot.data}\n');
              }),
        ),
      ),
    );
  }
}
