
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DeviceInfoService {

   Future<String> getDeviceInfo() async {
     DeviceInfo? deviceInfo;
     if(Platform.isAndroid) {
       AndroidDeviceInfo buildInfo = await DeviceInfoPlugin().androidInfo;
       deviceInfo = DeviceInfo(
           model: buildInfo.model,
           manufacturer: buildInfo.manufacturer,
           isPhysicalDevice: buildInfo.isPhysicalDevice,
           systemVersion: buildInfo.version.release,
           systemName: "Android"
       );
     } else if(Platform.isIOS) {
       IosDeviceInfo buildInfo = await DeviceInfoPlugin().iosInfo;
       deviceInfo = DeviceInfo(
           model: buildInfo.model,
           manufacturer: "Apple",
           isPhysicalDevice: buildInfo.isPhysicalDevice,
           systemVersion: buildInfo.utsname.release,
           systemName: "iOS"
       );
     }
     return jsonEncode(deviceInfo?.toJson() ?? "");
  }

}

class DeviceInfo {
  String model;
  String manufacturer;
  bool isPhysicalDevice;
  String systemVersion;
  String systemName;

  DeviceInfo({
    required this.model,
    required this.manufacturer,
    required this.isPhysicalDevice,
    required this.systemVersion,
    required this.systemName
  });

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'manufacturer': manufacturer,
      'isPhysicalDevice': isPhysicalDevice,
      'systemVersion': systemVersion,
      'systemName': systemName,
    };
  }


}