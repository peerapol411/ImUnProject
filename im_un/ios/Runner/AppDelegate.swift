import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    protectLocalData()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func protectLocalData() {
    let fileManager = FileManager.default
    guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
      return
    }

    let attributes: [FileAttributeKey: Any] = [
      .protectionKey: FileProtectionType.completeUntilFirstUserAuthentication
    ]
    do {
      // New files inherit the directory's protection. Existing files need it
      // applied explicitly when an app is upgraded.
      try fileManager.setAttributes(attributes, ofItemAtPath: documents.path)
      for item in try fileManager.contentsOfDirectory(at: documents, includingPropertiesForKeys: nil) {
        try fileManager.setAttributes(attributes, ofItemAtPath: item.path)
      }
    } catch {
      NSLog("Unable to apply local data protection")
    }
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}
