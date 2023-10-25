import 'package:flutter_tts/flutter_tts.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class TextToSpeechService {
  FlutterTts flutterTts = FlutterTts();

  TextToSpeechService() {
    flutterTts
      ..setLanguage("en-IN")
      ..setVoice({ "name": "en-in-x-end-network", "locale": "en-IN" });
  }

  setLanguage({required String languageCode}) {
    flutterTts.setLanguage(languageCode);
  }

  setVoice({required Map<String, String> voiceCode}) {
    flutterTts.setVoice(voiceCode);
  }

  playSound({required String text}) {
    flutterTts.speak(text);
  }

  stopSound() {
    flutterTts.stop();
  }
}