import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let nativoChannel = FlutterMethodChannel(
      name: "com.example.projeto_native_code/sum",
      binaryMessenger: controller.binaryMessenger
    )
    
    nativoChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        
        guard call.method == "calculateSum" else {
            result(FlutterMethodNotImplemented)
            return
        }
        
        if let args = call.arguments as? [String: Any],
           let a = args["a"] as? Int,
           let b = args["b"] as? Int {
            result(a + b)
        } else {
            result(-1)
        }
    })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
