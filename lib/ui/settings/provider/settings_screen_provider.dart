import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/services/text-to-speech/text_to_speech_service.dart';
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
    preferences.setString("x-narration-voice", voiceValue);
    getVoiceNarrationMap(value);
    notifyListeners();
  }

  String getVoiceNarrationMap(String value) {
    value.toLowerCase();
    Map<String, String> voiceMap = {
      "male" : "en-in-x-end-network",
      "female" : "en-in-x-enc-network"
    };
    TextToSpeechService textToSpeechService = GetIt.instance.get<TextToSpeechService>();
    Map<String, String> voiceCodeMap = { "name": voiceMap[value.toLowerCase()] ?? "en-in-x-end-network", "locale": "en-IN" };
    textToSpeechService.setVoice(voiceCode: voiceCodeMap);
    return voiceMap[value.toLowerCase()] ?? "";
  }

  Future<void> checkForInitialValues() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    speakerToggleValue = preferences.getBool("x-audio-narration-flag") ?? false;
    voiceValue = preferences.getString("x-narration-voice") ?? "Male";
    if(voiceValue.isEmpty) {
      voiceValue = "Male";
    }
  }

}