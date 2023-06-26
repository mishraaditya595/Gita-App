import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class RemoteConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(minutes: 1),
    ));
    await remoteConfig.fetchAndActivate();
    
    String authConfigString = remoteConfig.getString("auth_configuration");
    Map<String, dynamic> configDecoded = jsonDecode(authConfigString);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("SUPABASE_AUTHORIZATION", configDecoded["SUPABASE_AUTHORIZATION"]);
    prefs.setString("SUPABASE_API_KEY", configDecoded["SUPABASE_API_KEY"]);
    prefs.setString("SUPABASE_URI", configDecoded["SUPABASE_URI"]);
    prefs.setString("AD_UNIT_CHAPTER_SCREEN", configDecoded["AD_UNIT_CHAPTER_SCREEN"]);
    prefs.setString("MEDIUM_URI", configDecoded["MEDIUM_URI"]);
  }
}