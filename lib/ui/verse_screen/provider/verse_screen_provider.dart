import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/verse_bookmark_model.dart';
import '../services/verse_screen_service.dart';

class VerseScreenProvider extends ChangeNotifier {
  bool firstTime = true;
  List<ChapterDetailedModel> verseList = [];
  bool isBookmarked = false;
  bool isCommentaryAvailable = true;
  IconData fabIcon = Icons.bookmark_add;
  int chapterNumber = 0;
  int verseNumber = 0;
  ChapterDetailedModel _verseDetails = ChapterDetailedModel(verseNumber: "-1", chapterNumber: "-1", text: "text", transliteration: "transliteration", wordMeanings: "wordMeanings", translation: "translation", commentary: "commentary", verseNumberInt: -1);
  ChapterDetailedModel get verseDetails => _verseDetails;


  set verseDetails(ChapterDetailedModel verse) {
    if(firstTime) {
      _verseDetails = verse;
      firstTime = !firstTime;
    }
  }

  void fetchBookmarkDetails(String chapterNumber, String verseNumber) {
    VerseScreenService verseScreenService = GetIt.instance.get<VerseScreenService>();
    List<VerseBookmarkModel>? bookmarkList = verseScreenService.fetchBookmarkDetails(chapterNumber, verseNumber);

    if (bookmarkList.isNotEmpty) {
        fabIcon = Icons.bookmark_remove;
    } else {
        fabIcon = Icons.bookmark_add;
    }
    notifyListeners();
  }

  void addToLastRead(String translation, String chapterNumber, String verseNumber) {
    VerseScreenService verseScreenService = GetIt.instance.get<VerseScreenService>();
    verseScreenService.addVerseToLastRead(translation, chapterNumber, verseNumber);
  }

  navigateVerses(String operator) {
    VerseScreenService verseScreenService = GetIt.instance.get<VerseScreenService>();
    _verseDetails = verseScreenService.navigateVerses(operator, chapterNumber.toString(), verseNumber.toString()).first;
    this.chapterNumber = int.parse(_verseDetails!.chapterNumber);
    this.verseNumber = int.parse(_verseDetails!.verseNumber);

    if (_verseDetails!.commentary == null ||
        _verseDetails!.commentary.isEmpty) {
      isCommentaryAvailable = false;
    } else {
      isCommentaryAvailable = true;
    }

    addToLastRead(_verseDetails!.translation, _verseDetails!.chapterNumber, _verseDetails!.verseNumber);
    fetchBookmarkDetails(_verseDetails!.chapterNumber, _verseDetails!.verseNumber);
    notifyListeners();
  }


}