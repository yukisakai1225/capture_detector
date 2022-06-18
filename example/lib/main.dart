import 'package:capture_detector/capture_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _isCaptured;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder(
                stream: CaptureDetector.isCapturedStream,
                builder: (context, snapshot) {
                  return Text('stream: ${snapshot.data}\n');
                },
              ),
              Text("future : $_isCaptured"),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black.withOpacity(0.1))),
                onPressed: () async {
                  _isCaptured = await CaptureDetector.getIsCaptured;
                  setState(() {});
                },
                child: const Text("get IsCaptured"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
