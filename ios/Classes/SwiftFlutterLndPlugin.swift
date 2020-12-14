import Flutter
import UIKit
import Lndmobile

public class SwiftFlutterLndPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_lnd", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterLndPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
  
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch(call.method) {
    case "startLndService": startLndService(call, result: result)
    default: result(FlutterMethodNotImplemented)
    }
  }
  
  // Start the lnd service. lnddir should be a directory we can write to, like getApplicationDocumentsDirectory() from Dart.
  private func startLndService(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let arguments = call.arguments as? [String:Any] else {
        result(FlutterError(code: "ARGUMENTS", message: "Invalid arguments supplied", details: nil))
        return
    }
    
    // Verify lnddir supplied
    let lnddir: String = (arguments["lnddir"] as? String) ?? ""
    if (lnddir.isEmpty) {
      result(FlutterError(code: "ARGUMENTS", message: "Must supply a valid string for lnddir", details: nil))
      return
    }
    
    LndmobileStart("--lnddir=\(lnddir) --bitcoin.testnet", LndUnlockerReady(), LndRpcReady())
  }
}

// The unlockerReady callback is called when the WalletUnlocker service is
// ready.
class LndUnlockerReady: LndmobileCallback {
  override func onError(_ error: Error?) {
    print("LndUnlockerReady error: \(error?.localizedDescription ?? "")")
    
    // TODO: emit stream events for subscribed dart listeners
  }
  
  override func onResponse(_ data: Data?) {
    print("LndUnlockerReady response")
    
    // TODO: emit stream events for subscribed dart listeners
  }
}

// The rpcReady callback is called after the wallet has been unlocked and lnd is
// ready to accept RPC calls
class LndRpcReady: LndmobileCallback {
  override func onError(_ error: Error?) {
    print("LndRpcReady error: \(error?.localizedDescription ?? "")")
    
    // TODO: emit stream events for subscribed dart listeners
  }
  
  override func onResponse(_ data: Data?) {
    print("LndRpcReady response")
    
    // TODO: emit stream events for subscribed dart listeners
  }
}
