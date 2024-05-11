import Foundation
import UIKit
import Flutter
import YandexMapsMobile

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    YMKMapKit.setApiKey(Environment.YandexMapkitAPIKey)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

public struct Environment {
    enum Keys {
        static let YandexMapkitAPIKey = "YandexMapkitAPIKey"
    }
    
    static let YandexMapkitAPIKey: String = {
        guard let YandexMapkitAPIKeyProperty = Bundle.main.object(
            forInfoDictionaryKey: Keys.YandexMapkitAPIKey
        ) as? String else {
            fatalError("\(Keys.YandexMapkitAPIKey) not found")
        }
        return YandexMapkitAPIKeyProperty
    }()
}
