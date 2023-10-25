import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/services/text-to-speech/text_to_speech_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/verse_bookmark_model.dart';
import '../../../services/db/database_service.dart';
import '../services/verse_screen_service.dart';

class VerseScreenProvider extends ChangeNotifier {
  bool firstTime = true;
  List<ChapterDetailedModel> verseList = [];
  bool isBookmarked = false;
  bool isCommentaryAvailable = true;
  IconData fabIcon = Icons.bookmark_add;
  IconData speakerIcon = Icons.volume_off;
  int chapterNumber = 0;
  int verseNumber = 0;
  bool speakerFlag = false;
  TextToSpeechService textToSpeechObj = GetIt.instance.get<TextToSpeechService>();
  ChapterDetailedModel _verseDetails = ChapterDetailedModel(
      verseNumber: "-1",
      chapterNumber: "-1",
      text: "text",
      transliteration: "transliteration",
      wordMeanings: "wordMeanings",
      translation: "translation",
      commentary: "commentary",
      verseNumberInt: -1,
      bookHashName: '');
  ChapterDetailedModel get verseDetails => _verseDetails;


  VerseScreenProvider()  {
  }

  Future<void> checkForVoiceSettings() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    speakerFlag = preferences.getBool("x-audio-narration-flag") ?? false;
    notifyListeners();
  }

  setInitialValue(ChapterDetailedModel verse, int chapNum, int verseNum) async {
    if (firstTime) {
      _verseDetails = verse;
      chapterNumber = chapNum;
      verseNumber = verseNum;
      firstTime = !firstTime;
      await checkForVoiceSettings();
      speakerIcon = speakerFlag ? Icons.volume_up : Icons.volume_off;
      if(_verseDetails.translation.isNotEmpty && speakerFlag) {
        textToSpeechObj.playSound(text: _verseDetails.translation);
      }
      fetchBookmarkDetails(verse.chapterNumber, verse.verseNumber, verse.bookHashName);
    }
  }

  void fetchBookmarkDetails(String chapterNumber, String verseNumber, String bookHashName) {
    VerseScreenService verseScreenService =
        GetIt.instance.get<VerseScreenService>();
    List<VerseBookmarkModel>? bookmarkList =
        verseScreenService.fetchBookmarkDetails(chapterNumber, verseNumber, bookHashName);

    if (bookmarkList.isNotEmpty) {
      fabIcon = Icons.bookmark_remove;
    } else {
      fabIcon = Icons.bookmark_add;
    }
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   notifyListeners();
    // });
  }

  void addToLastRead(
      String translation, String chapterNumber, String verseNumber) {
    VerseScreenService verseScreenService =
        GetIt.instance.get<VerseScreenService>();
    verseScreenService.addVerseToLastRead(
        translation, chapterNumber, verseNumber);
  }

  navigateVerses(String operator) async {
    VerseScreenService verseScreenService =
        GetIt.instance.get<VerseScreenService>();
    ChapterDetailedModel? verse = verseScreenService.navigateVerses(
        operator, chapterNumber.toString(), verseNumber.toString(), _verseDetails.bookHashName);
    if (verse != null) {
      _verseDetails = verse;
      this.chapterNumber = int.parse(_verseDetails!.chapterNumber);
      this.verseNumber = int.parse(_verseDetails!.verseNumber);

      if (_verseDetails!.commentary == null ||
          _verseDetails!.commentary.isEmpty) {
        isCommentaryAvailable = false;
      } else {
        isCommentaryAvailable = true;
      }

      addToLastRead(_verseDetails.translation, _verseDetails.chapterNumber,
          _verseDetails.verseNumber);
      fetchBookmarkDetails(
          _verseDetails.chapterNumber, _verseDetails.verseNumber, _verseDetails.bookHashName);
      await checkForVoiceSettings();
      if(verseDetails.transliteration.isNotEmpty && speakerFlag) {
        textToSpeechObj.playSound(text: verseDetails.translation);
      }
      notifyListeners();
    }
  }

  addOrRemoveBookmarks(ChapterDetailedModel verseDetails) async {
    VerseScreenService verseScreenService =
        GetIt.instance.get<VerseScreenService>();

    if (fabIcon == Icons.bookmark_add) {
      // <--- Bookmark to be added --->
      fabIcon = Icons.bookmark_remove;
      verseScreenService.addBookmark(verseDetails);
    } else {
      fabIcon = Icons.bookmark_add;
      await verseScreenService.removeBookmark(verseDetails);
    }
    notifyListeners();
  }

  toggleSpeaker() async {
    if(speakerIcon == Icons.volume_off) {
      speakerIcon = Icons.volume_up;
      if(verseDetails.transliteration.isNotEmpty) {
        textToSpeechObj.playSound(text: verseDetails.translation);
      }
    } else {
      speakerIcon = Icons.volume_off;
      textToSpeechObj.stopSound();
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("x-audio-narration-flag", speakerIcon == Icons.volume_up);
    speakerFlag = speakerIcon == Icons.volume_up;
    notifyListeners();
  }
}
