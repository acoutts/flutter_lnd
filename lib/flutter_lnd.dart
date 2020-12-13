
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterLnd {
  static const MethodChannel _channel =
      const MethodChannel('flutter_lnd');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
