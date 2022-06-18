import Flutter
import UIKit

public class SwiftCaptureDetectorPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let _eventChannel = FlutterEventChannel(name: "capture_detector/stream", binaryMessenger: registrar.messenger())
        let instance = SwiftCaptureDetectorPlugin()
        _eventChannel.setStreamHandler(instance)
        
        let _methodChannel = FlutterMethodChannel(name: "capture_detector", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: _methodChannel)
        
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "isCaptured" {
            result(UIScreen.main.isCaptured)
        }
    }
    
    public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = eventSink
        sendCaptureStateEvent()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.didCapturedScreen),
            name: UIScreen.capturedDidChangeNotification,
            object: nil
        )
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        NotificationCenter.default.removeObserver(self)
        self.eventSink = nil
        return nil
    }
    
    @objc private func didCapturedScreen(notification: Notification) {
        sendCaptureStateEvent()
    }
    
    private func sendCaptureStateEvent() {
        guard let eventSink = self.eventSink else {
            return
        }
        eventSink(UIScreen.main.isCaptured)
    }
}
