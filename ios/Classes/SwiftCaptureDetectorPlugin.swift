import Flutter
import UIKit

public class SwiftCaptureDetectorPlugin: NSObject, FlutterPlugin, FlutterStreamHandler {
  private var eventSink: FlutterEventSink?

      //まずこれが呼ばれる
      public static func register(with registrar: FlutterPluginRegistrar) {
          let _eventChannel = FlutterEventChannel(name: "capture_detector", binaryMessenger: registrar.messenger())
          let instance = SwiftCaptureDetectorPlugin()
          _eventChannel.setStreamHandler(instance)
      }

      public func onListen(withArguments arguments: Any?, eventSink: @escaping FlutterEventSink) -> FlutterError? {
          self.eventSink = eventSink
          sendCaputureStateEvent()
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
          sendCaputureStateEvent()
      }

      private func sendCaputureStateEvent() {
          guard let eventSink = self.eventSink else {
            return
          }
          eventSink(UIScreen.main.isCaptured)
      }
}
