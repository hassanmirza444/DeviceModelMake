import 'package:flutter/services.dart';

class DeviceModelMakePlugin{
  static const MethodChannel _channel = const MethodChannel('hassanmirza444.github.com/deviceModelMakePlugin');
  static Future<dynamic> get modelMake => _channel.invokeMethod('getDeviceModelMake');
}