import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class RemoteConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  void init() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
    await remoteConfig.fetchAndActivate();
    
    var temp = remoteConfig.getString("auth_configuration");
    debugPrint("Remote config test: $temp");
  }
}