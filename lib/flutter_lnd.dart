import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FlutterLnd {
  static const MethodChannel _channel = const MethodChannel('flutter_lnd');

  static Future<String?> startLndService() async {
    final workingDir = await getApplicationDocumentsDirectory();

    await _channel.invokeMethod('startLndService', {
      'lnddir': workingDir.path,
    });
  }
}
