import Flutter
import UIKit

public class IosReceiptPlugin: NSObject, FlutterPlugin {
    
    func getAppleReceipt() -> String? {
        guard let appStoreReceiptURL = Bundle.main.appStoreReceiptURL,
              FileManager.default.fileExists(atPath: appStoreReceiptURL.path) else {
            return nil
        }
        let receiptData = try? Data(contentsOf: appStoreReceiptURL, options: .alwaysMapped)
        return receiptData?.base64EncodedString(options: [])
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "ios_receipt", binaryMessenger: registrar.messenger())
        let instance = IosReceiptPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "getAppleReceipt":
            let receipt = getAppleReceipt()
            result(receipt)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
