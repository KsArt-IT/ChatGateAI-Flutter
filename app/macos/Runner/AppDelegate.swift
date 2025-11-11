import Cocoa
import FlutterMacOS
import GoogleSignIn

@main
class AppDelegate: FlutterAppDelegate {
  // for GoogleSignIn
  override func application(_ application: NSApplication, open urls: [URL]) {
    for url in urls {
      GIDSignIn.sharedInstance.handle(url)
    }
  }

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
