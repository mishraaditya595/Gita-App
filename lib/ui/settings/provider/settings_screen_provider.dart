import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreenProvider extends ChangeNotifier{
  bool toggleValue = false;
  List<String> voiceList = ["Male", "Female"];
  String dropdownValue = "Male";

  Future<void> setNarrationToggleValue(bool value) async {
    toggleValue = value;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("x-audio-narration-flag", toggleValue);
    notifyListeners();
  }

  Future<void> setVoice(String value) async {
    dropdownValue = value;
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

}