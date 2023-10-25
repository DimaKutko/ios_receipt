import 'ios_receipt_platform_interface.dart';

class IosReceipt {
  static Future<String?> getPlatformVersion() {
    return IosReceiptPlatform.instance.getPlatformVersion();
  }

  static Future<String?> getAppleReceipt() {
    return IosReceiptPlatform.instance.getAppleReceipt();
  }
}
