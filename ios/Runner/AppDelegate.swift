import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    weak var registrar = self.registrar(forPlugin: "ios-native")

    let factory = SampleViewController(messenger: registrar!.messenger())
    self.registrar(forPlugin: "FLPlugin")!.register(
        factory,
        withId: "SampleViewController")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = SampleViewController(messenger: registrar.messenger())
        registrar.register(factory, withId: "SampleViewController")
    }
}
