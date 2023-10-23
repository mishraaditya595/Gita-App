import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreenProvider extends ChangeNotifier{
  bool speakerToggleValue = false;
  List<String> voiceList = ["Male", "Female"];
  String voiceValue = "Male";

  SettingsScreenProvider() {

  }

  Future<void> setNarrationToggleValue(bool value) async {
    speakerToggleValue = value;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("x-audio-narration-flag", speakerToggleValue);
    notifyListeners();
  }

  Future<void> setVoice(String value) async {
    voiceValue = value;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("x-narration-voice", getVoiceNarrationMap(value));
    notifyListeners();
  }

  String getVoiceNarrationMap(String value) {
    value.toLowerCase();
    Map<String, String> voiceMap = {
      "male" : "en-in-x-end-network",
      "female" : "en-in-x-enc-network"
    };
    return voiceMap[value] ?? "";
  }

  Future<void> checkForInitialValues() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    speakerToggleValue = preferences.getBool("x-audio-narration-flag") ?? false;
    voiceValue = preferences.getString("x-narration-voice") ?? "Male";
  }

}