import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/services/device-info/device_info_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../providers/network_connectivity_provider.dart';

class FirebasePerformanceService {
  ///this method is written to log firebase trace.
  static Future<T> logTrace<T>(
      String eventName, Future<T> Function() asyncFunction) async {

    DeviceInfoService deviceInfoService = GetIt.instance.get<DeviceInfoService>();
    String deviceInfo = await deviceInfoService.getDeviceInfo();

    if (Firebase.apps.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      FirebasePerformance performance = FirebasePerformance.instance;
      final Trace trace = performance.newTrace(eventName);
      trace.putAttribute("DeviceInfo", deviceInfo);
      await trace.start();
      T res;
      try {
        res = await asyncFunction();
        trace.putAttribute("status", "success");
      } catch (e) {
        trace.putAttribute("status", "failure");
        throw e;
      }
      await trace.stop();
      return res;
    } else {
      T res = await asyncFunction();
      return res;
    }
  }
}
