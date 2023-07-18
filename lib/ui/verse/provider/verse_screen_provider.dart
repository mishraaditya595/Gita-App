import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get_it/get_it.dart';

import '../../../models/ui/chapter_detailed_model_ui.dart';
import '../../../models/verse_bookmark_model.dart';
import '../../../services/db/database_service.dart';
import '../services/verse_screen_service.dart';

class VerseScreenProvider extends ChangeNotifier {
  bool firstTime = true;
  List<ChapterDetailedModel> verseList = [];
  bool isBookmarked = false;
  bool isCommentaryAvailable = true;
  IconData fabIcon = Icons.bookmark_add;
  int chapterNumber = 0;
  int verseNumber = 0;
  ChapterDetailedModel _verseDetails = ChapterDetailedModel(
      verseNumber: "-1",
      chapterNumber: "-1",
      text: "text",
      transliteration: "transliteration",
      wordMeanings: "wordMeanings",
      translation: "translation",
      commentary: "commentary",
      verseNumberInt: -1);
  ChapterDetailedModel get verseDetails => _verseDetails;

  setInitialValue(ChapterDetailedModel verse, int chapNum, int verseNum) {
    if (firstTime) {
      _verseDetails = verse;
      chapterNumber = chapNum;
      verseNumber = verseNum;
      firstTime = !firstTime;
      fetchBookmarkDetails(verse.chapterNumber ?? "", verse.verseNumber ?? "");
    }
  }

  Future<void> fetchBookmarkDetails(String chapterNumber, String verseNumber) async {
    VerseScreenService verseScreenService =
        GetIt.instance.get<VerseScreenService>();
    List<VerseBookmarkModel>? bookmarkList = await
        verseScreenService.fetchBookmarkDetails(chapterNumber, verseNumber);

    if (bookmarkList.isNotEmpty) {
      fabIcon = Icons.bookmark_remove;
    } else {
      fabIcon = Icons.bookmark_add;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
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
    ChapterDetailedModel? verse = await verseScreenService.navigateVerses(
        operator, chapterNumber.toString(), verseNumber.toString());
    if (verse != null) {
      _verseDetails = verse;
      this.chapterNumber = int.parse(_verseDetails!.chapterNumber ?? "0");
      this.verseNumber = int.parse(_verseDetails!.verseNumber ?? "0");

      if (_verseDetails!.commentary != null &&
          _verseDetails!.commentary!.isNotEmpty) {
        isCommentaryAvailable = true;
      } else {
        isCommentaryAvailable = false;
      }

      addToLastRead(_verseDetails!.translation ?? "", _verseDetails!.chapterNumber ?? "",
          _verseDetails!.verseNumber ?? "");
      fetchBookmarkDetails(
          _verseDetails!.chapterNumber ?? "", _verseDetails!.verseNumber ?? "");
      notifyListeners();
    }
  }

  addOrRemoveBookmarks(ChapterDetailedModel verseDetails) {
    VerseScreenService verseScreenService =
        GetIt.instance.get<VerseScreenService>();

    if (fabIcon == Icons.bookmark_add) {
      // <--- Bookmark to be added --->
      fabIcon = Icons.bookmark_remove;
      verseScreenService.addBookmark(verseDetails);
    } else {
      fabIcon = Icons.bookmark_add;
      verseScreenService.removeBookmark(verseDetails);
    }
    notifyListeners();
  }
}
