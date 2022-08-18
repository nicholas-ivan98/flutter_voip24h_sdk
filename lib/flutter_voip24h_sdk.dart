import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_voip24h_sdk/callkit/call_module.dart';
import 'package:flutter_voip24h_sdk/graph/graph_module.dart';

class FlutterVoip24hSdk {

  static const MethodChannel _channel = MethodChannel('flutter_voip24h_sdk_method_channel');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static GraphModule graphModule = GraphModule.instance;
  static CallModule callModule = CallModule.instance;
}
