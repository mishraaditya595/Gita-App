import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:sbg/services/db/database_service.dart';
import '../../../models/ui/chapter_detailed_model_ui.dart' as UiModel;
import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../../../models/verse_bookmark_model.dart';

@Singleton()
class VerseScreenService {
  DatabaseService databaseService;

  VerseScreenService(this.databaseService);

  Future<List<VerseBookmarkModel>> fetchBookmarkDetails(
      String chapterNumber, String verseNumber) async {
    Isar isar = databaseService.getStore()!;

    List<VerseBookmarkModel> bookmarkList = await isar.verseBookmarkModels.filter()
        .verseNumberEqualTo(verseNumber)
        .and()
        .chapterNumberEqualTo(chapterNumber)
        .findAll();

    return bookmarkList;
  }

  void addVerseToLastRead(
      String translation, String chapterNumber, String verseNumber) {
    Isar isar = databaseService.getStore()!;

    isar.lastReadModels.where().deleteAll();

    isar.writeTxn(() async {
      await isar.lastReadModels.put(LastReadModel()
          ..chapterNumber = int.parse(chapterNumber)
          ..verseNumber = int.parse(verseNumber)
          ..lastReadVerseText = translation
          ..lastReadVerseNum = "$chapterNumber.$verseNumber"
      );
    });
  }

  Future<UiModel.ChapterDetailedModel?> navigateVerses(
      String operator, String chapterNumber, String verseNumber) async {
    int currentChapter = int.parse(chapterNumber);
    int currentVerse = int.parse(verseNumber);
    List<ChapterDetailedModel> navigatedVerse = [];
    switch (operator) {
      case "NEXT":
        navigatedVerse = await navigateToNextVerse(currentChapter, currentVerse);
        break;
      case "PREVIOUS":
        navigatedVerse = await navigateToPreviousVerse(currentChapter, currentVerse);
        break;
    }


    if (navigatedVerse.isNotEmpty) {
      return  UiModel.ChapterDetailedModel(
        verseNumber: navigatedVerse.first.verseNumber,
        chapterNumber: navigatedVerse.first.chapterNumber,
        text: navigatedVerse.first.text,
        transliteration: navigatedVerse.first.transliteration,
        wordMeanings: navigatedVerse.first.wordMeanings,
        translation: navigatedVerse.first.translation,
        commentary: navigatedVerse.first.commentary,
        verseNumberInt: navigatedVerse.first.verseNumberInt,
      );
    } else {
      return null;
    }
  }

  Future<List<ChapterDetailedModel>> navigateToNextVerse(
      int currentChapter, int currentVerse) async {
    Isar isar = databaseService.getStore()!;
    int nextChapter = currentChapter;
    int nextVerse = currentVerse + 1;

    List<ChapterSummaryModel>? chapterSummaryList = await isar.chapterSummaryModels.filter()
        .chapterNumberEqualTo("$currentChapter")
        .findAll();

    var verseCount = chapterSummaryList.first.verseCount;

    if (verseCount == currentVerse) {
      nextChapter = currentChapter + 1;
      nextVerse = 1;
    }

    int totalChapter = await isar.chapterSummaryModels.count();

    List<ChapterDetailedModel> chapterDetailedList = [];
    if (nextChapter > totalChapter == false) {
      chapterDetailedList = await isar.chapterDetailedModels.filter()
          .verseNumberEqualTo("$nextChapter")
          .findAll();
    }

    return chapterDetailedList;
  }

  Future<List<ChapterDetailedModel>> navigateToPreviousVerse(
      int currentChapter, int currentVerse) async {
    Isar isar = databaseService.getStore()!;
    int previousChapter = currentChapter;
    int previousVerse = currentVerse - 1;


    List<ChapterSummaryModel>? chapterSummaryList = await isar.chapterSummaryModels
        .filter()
        .chapterNumberEqualTo("$previousChapter")
        .findAll();

    if (currentVerse == 1) {
      previousChapter = currentChapter - 1;

      List<ChapterSummaryModel>? chapterSummaryList = await isar.chapterSummaryModels
          .filter()
          .chapterNumberEqualTo("$previousChapter")
          .findAll();

      if (chapterSummaryList.isNotEmpty) {
        previousVerse = chapterSummaryList.first.verseCount ?? -1;
      }
    }

    List<ChapterDetailedModel> chapterDetailedList = [];
    if (previousChapter != 0) {
      chapterDetailedList = await isar.chapterDetailedModels.filter()
          .verseNumberEqualTo("$previousVerse")
          .and()
          .chapterNumberEqualTo("$previousChapter")
          .findAll();
    }
    return chapterDetailedList;
  }

  Future<void> addBookmark(UiModel.ChapterDetailedModel verseDetails) async {
    Isar isar = databaseService.getStore()!;
    DateTime currentDateTime = DateTime.now();

    List<VerseBookmarkModel>? bookmarkList = await isar.verseBookmarkModels.filter()
        .verseNumberEqualTo(verseDetails.verseNumber)
        .and()
        .chapterNumberEqualTo(verseDetails.chapterNumber).findAll();

    if (bookmarkList.isEmpty) {
      // <--- add bookmark to the table as it is not present already --->
      isar.writeTxn(() async {
        await isar.verseBookmarkModels.put(
            VerseBookmarkModel()
                ..verseNumber = verseDetails.verseNumber
            ..chapterNumber = verseDetails.chapterNumber
            ..text = verseDetails.text
            ..transliteration = verseDetails.transliteration
            ..wordMeanings = verseDetails.wordMeanings
            ..translation = verseDetails.translation
            ..commentary = verseDetails.commentary
            ..verseNumberInt = verseDetails.verseNumberInt
            ..creationTime = currentDateTime.microsecondsSinceEpoch);
      });
    }
  }

  void removeBookmark(UiModel.ChapterDetailedModel verseDetails) {
    Isar isar = databaseService.getStore()!;

    isar.verseBookmarkModels.filter()
    .verseNumberEqualTo(verseDetails.verseNumber)
    .and()
    .chapterNumberEqualTo(verseDetails.chapterNumber)
    .deleteAll();

  }
}
