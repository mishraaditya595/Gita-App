import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:sbg/services/db/database_service.dart';
import 'package:sbg/ui/bookhome/provider/home_page_provider.dart';
import 'package:sbg/utils/global_variables.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../../../models/verse_bookmark_model.dart';

@Singleton()
class VerseScreenService {
  DatabaseService databaseService;

  VerseScreenService(this.databaseService);

  List<VerseBookmarkModel> fetchBookmarkDetails(
      String chapterNumber, String verseNumber, String bookHashName) {
    Box<VerseBookmarkModel> verseBookmarkModelBox =
        databaseService.getStore<VerseBookmarkModel>(describeEnum(DbModel.VerseBookmarkModel));

    List<VerseBookmarkModel> bookmarkList = verseBookmarkModelBox.values.where(
            (element) =>
            element.verseNumber == verseNumber &&
                element.chapterNumber == chapterNumber &&
                element.bookHashName == bookHashName).toList();

    return bookmarkList;
  }

  Future<void> addVerseToLastRead(
      String translation, String chapterNumber, String verseNumber, String bookName) async {
    Box<LastReadModel> lastReadModelBox = databaseService.getStore<LastReadModel>(describeEnum(DbModel.LastReadModel));
    bool lastReadFound = false;

    List<LastReadModel> lastReadList = lastReadModelBox.values.toList();

    for(LastReadModel lastReadModel in lastReadList) {
      if(lastReadModel.bookHashName == bookName) {
        lastReadFound = true;
        lastReadModel.lastReadVerseText = translation;
        lastReadModel.lastReadVerseNum = "$chapterNumber.$verseNumber";
        lastReadModel.verseNumber = int.parse(verseNumber);
        lastReadModel.chapterNumber = int.parse(chapterNumber);
        break;
      }
    }

    if(!lastReadFound) {
      lastReadList.add(LastReadModel(
        lastReadVerseText: translation,
        lastReadVerseNum: "$chapterNumber.$verseNumber",
        verseNumber: int.parse(verseNumber),
        chapterNumber: int.parse(chapterNumber),
        bookHashName: bookName,
      ));
    }

    await lastReadModelBox.clear();
    lastReadModelBox.addAll(lastReadList);

    if(GlobalVariables.homePageKey.currentState != null) {
      HomePageProvider homePageProvider = Provider.of(
          GlobalVariables.homePageKey.currentState!.context!);
      homePageProvider.lastReadVerseNum = "$chapterNumber.$verseNumber";
      homePageProvider.lastReadVerseText = translation;
      homePageProvider.lastReadChapterInt = int.tryParse(chapterNumber) ?? 0;
      homePageProvider.lastReadVerseInt = int.tryParse(verseNumber) ?? 0;
      homePageProvider.isLastReadAvailable = true;
    }
  }

  ChapterDetailedModel? navigateVerses(
      String operator, String chapterNumber, String verseNumber, String bookHashName) {
    int currentChapter = int.parse(chapterNumber);
    int currentVerse = int.parse(verseNumber);
    List<ChapterDetailedModel> navigatedVerse = [];
    switch (operator) {
      case "NEXT":
        navigatedVerse = navigateToNextVerse(currentChapter, currentVerse, bookHashName);
        break;
      case "PREVIOUS":
        navigatedVerse = navigateToPreviousVerse(currentChapter, currentVerse, bookHashName);
        break;
    }
    if (navigatedVerse.isNotEmpty) {
      return navigatedVerse.first;
    } else {
      return null;
    }
  }

  List<ChapterDetailedModel> navigateToNextVerse(
      int currentChapter, int currentVerse, String bookHashName) {
    int nextChapter = currentChapter;
    int nextVerse = currentVerse + 1;

    Box<ChapterSummaryModel> chapterSummaryModelBox =
        databaseService.getStore<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));

    List<ChapterSummaryModel>? chapterSummaryList = chapterSummaryModelBox.values.where(
            (element) =>
            element.chapterNumber == currentChapter.toString() &&
        element.bookHashName == bookHashName
    ).toList();

    var verseCount = chapterSummaryList.first.verseCount;

    if (verseCount == currentVerse) {
      nextChapter = currentChapter + 1;
      nextVerse = 1;
    }

    int totalChapter = chapterSummaryModelBox.values.toList().length;

    List<ChapterDetailedModel> chapterDetailedList = [];
    if (nextChapter > totalChapter == false) {
      Box<ChapterDetailedModel> chapterDetailedModelBox =
          databaseService.getStore<ChapterDetailedModel>(describeEnum(DbModel.ChapterDetailedModel));

      chapterDetailedList = chapterDetailedModelBox.values.where(
              (element) =>
              element.verseNumber == nextVerse.toString() &&
                  element.chapterNumber == nextChapter.toString() &&
          element.bookHashName == bookHashName
      ).toList();
    }

    return chapterDetailedList;
  }

  List<ChapterDetailedModel> navigateToPreviousVerse(
      int currentChapter, int currentVerse, String bookHashName) {
    int previousChapter = currentChapter;
    int previousVerse = currentVerse - 1;

    Box<ChapterSummaryModel> chapterSummaryModelBox =
    databaseService.getStore<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));

    List<ChapterSummaryModel>? chapterSummaryList = chapterSummaryModelBox.values.where(
            (element) =>
            element.chapterNumber == previousChapter.toString() &&
        element.bookHashName == bookHashName).toList();
    var verseCount = chapterSummaryList.first.verseCount;

    if (currentVerse == 1) {
      previousChapter = currentChapter - 1;
      Box<ChapterSummaryModel> chapterSummaryModelBox =
          databaseService.getStore<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));

      List<ChapterSummaryModel>? chapterSummaryList = chapterSummaryModelBox.values.where(
              (element) =>
              element.chapterNumber == previousChapter.toString()
      && element.bookHashName == bookHashName).toList();

      if (chapterSummaryList.isNotEmpty) {
        previousVerse = chapterSummaryList.first.verseCount;
      }
    }

    List<ChapterDetailedModel> chapterDetailedList = [];
    if (previousChapter != 0) {
      Box<ChapterDetailedModel> chapterDetailedModelBox =
          databaseService.getStore<ChapterDetailedModel>(describeEnum(DbModel.ChapterDetailedModel));

      chapterDetailedList = chapterDetailedModelBox.values.where(
              (element) =>
              element.verseNumber == previousVerse.toString() &&
          element.chapterNumber == previousChapter.toString() &&
          element.bookHashName == bookHashName
      ).toList();
    }
    return chapterDetailedList;
  }

  void addBookmark(ChapterDetailedModel verseDetails) {
    DateTime currentDateTime = DateTime.now();

    Box<VerseBookmarkModel> verseBookmarkModelBox =
        databaseService.getStore<VerseBookmarkModel>(describeEnum(DbModel.VerseBookmarkModel));

    List<VerseBookmarkModel>? bookmarkList = verseBookmarkModelBox.values.where(
            (element) =>
            element.verseNumber == verseDetails.verseNumber &&
                element.chapterNumber == verseDetails.chapterNumber &&
        element.bookHashName == verseDetails.bookHashName).toList();

    if (bookmarkList.isEmpty) {
      // <--- add bookmark to the table as it is not present already --->
      verseBookmarkModelBox.add(VerseBookmarkModel(
          verseNumber: verseDetails.verseNumber,
          chapterNumber: verseDetails.chapterNumber,
          text: verseDetails.text,
          transliteration: verseDetails.transliteration,
          wordMeanings: verseDetails.wordMeanings,
          translation: verseDetails.translation,
          commentary: verseDetails.commentary,
          verseNumberInt: verseDetails.verseNumberInt,
          creationTime: currentDateTime.microsecondsSinceEpoch,
          bookHashName: verseDetails.bookHashName));
    }
  }

  ChapterDetailedModel? getVerseDetails(String chapterNum, String verseNum, String bookHashName) {
    Box<ChapterDetailedModel> chapterDetailedModelBox =
    databaseService.getStore<ChapterDetailedModel>(describeEnum(DbModel.ChapterDetailedModel));

    List<ChapterDetailedModel> chapterDetailedList = chapterDetailedModelBox.values.where(
            (element) =>
        element.verseNumber == verseNum &&
            element.chapterNumber == chapterNum.toString() &&
            element.bookHashName == bookHashName
    ).toList();

    if(chapterDetailedList.isNotEmpty) {
      return chapterDetailedList.first;
    } else {
      return null;
    }
  }

  Future<void> removeBookmark(ChapterDetailedModel verseDetails) async {
    Box<VerseBookmarkModel> verseBookmarkModelBox =
    databaseService.getStore<VerseBookmarkModel>(describeEnum(DbModel.VerseBookmarkModel));

    List<VerseBookmarkModel>? bookmarkList = verseBookmarkModelBox.values.where(
            (element) =>
        element.verseNumber == verseDetails.verseNumber &&
            element.chapterNumber == verseDetails.chapterNumber).toList();


    await verseBookmarkModelBox.delete(bookmarkList[0].id);

  }
}
