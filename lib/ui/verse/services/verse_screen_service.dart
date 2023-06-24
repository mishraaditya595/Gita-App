import 'package:injectable/injectable.dart';
import 'package:sbg/services/db/database_service.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../../../models/verse_bookmark_model.dart';
import '../../../objectbox.g.dart';

@Singleton()
class VerseScreenService {
  DatabaseService databaseService;

  VerseScreenService(this.databaseService);

  List<VerseBookmarkModel> fetchBookmarkDetails(
      String chapterNumber, String verseNumber) {
    Store store = databaseService.getStore()!;
    Box<VerseBookmarkModel> verseBookmarkModelBox =
        store.box<VerseBookmarkModel>();
    QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
        VerseBookmarkModel_.verseNumber.equals(verseNumber) &
            VerseBookmarkModel_.chapterNumber.equals(chapterNumber));
    Query<VerseBookmarkModel> query = queryBuilder.build();
    List<VerseBookmarkModel> bookmarkList = query.find();

    return bookmarkList;
  }

  void addVerseToLastRead(
      String translation, String chapterNumber, String verseNumber) {
    Store store = databaseService.getStore()!;
    Box<LastReadModel> lastReadModelBox = store.box<LastReadModel>();
    lastReadModelBox.removeAll();
    lastReadModelBox.put(LastReadModel(
      lastReadVerseText: translation,
      lastReadVerseNum: "$chapterNumber.$verseNumber",
      verseNumber: int.parse(verseNumber),
      chapterNumber: int.parse(chapterNumber),
    ));
  }

  ChapterDetailedModel? navigateVerses(
      String operator, String chapterNumber, String verseNumber) {
    int currentChapter = int.parse(chapterNumber);
    int currentVerse = int.parse(verseNumber);
    List<ChapterDetailedModel> navigatedVerse = [];
    switch (operator) {
      case "NEXT":
        navigatedVerse = navigateToNextVerse(currentChapter, currentVerse);
        break;
      case "PREVIOUS":
        navigatedVerse = navigateToPreviousVerse(currentChapter, currentVerse);
        break;
    }
    if (navigatedVerse.isNotEmpty) {
      return navigatedVerse.first;
    } else {
      return null;
    }
  }

  List<ChapterDetailedModel> navigateToNextVerse(
      int currentChapter, int currentVerse) {
    Store store = databaseService.getStore()!;
    int nextChapter = currentChapter;
    int nextVerse = currentVerse + 1;

    Box<ChapterSummaryModel> chapterSummaryModelBox =
        store.box<ChapterSummaryModel>();
    QueryBuilder<ChapterSummaryModel> queryBuilder =
        chapterSummaryModelBox.query(ChapterSummaryModel_.chapterNumber
            .equals((currentChapter).toString()));
    Query<ChapterSummaryModel> query = queryBuilder.build();
    List<ChapterSummaryModel>? chapterSummaryList = query.find();
    var verseCount = chapterSummaryList.first.verseCount;

    if (verseCount == currentVerse) {
      nextChapter = currentChapter + 1;
      nextVerse = 1;
    }

    int totalChapter = store.box<ChapterSummaryModel>().getAll().length;

    List<ChapterDetailedModel> chapterDetailedList = [];
    if (nextChapter > totalChapter == false) {
      Box<ChapterDetailedModel> chapterDetailedModelBox =
          store.box<ChapterDetailedModel>();
      QueryBuilder<ChapterDetailedModel> queryBuilder2 =
          chapterDetailedModelBox.query(
              ChapterDetailedModel_.verseNumber.equals((nextVerse).toString()) &
                  ChapterDetailedModel_.chapterNumber
                      .equals((nextChapter).toString()));
      Query<ChapterDetailedModel> query2 = queryBuilder2.build();
      chapterDetailedList = query2.find();
    }

    return chapterDetailedList;
  }

  List<ChapterDetailedModel> navigateToPreviousVerse(
      int currentChapter, int currentVerse) {
    Store store = databaseService.getStore()!;
    int previousChapter = currentChapter;
    int previousVerse = currentVerse - 1;

    Box<ChapterSummaryModel> chapterSummaryModelBox =
        store.box<ChapterSummaryModel>();
    QueryBuilder<ChapterSummaryModel> queryBuilder =
        chapterSummaryModelBox.query(ChapterSummaryModel_.chapterNumber
            .equals((previousChapter).toString()));
    Query<ChapterSummaryModel> query = queryBuilder.build();
    List<ChapterSummaryModel>? chapterSummaryList = query.find();
    // var verseCount = chapterSummaryList.first.verseCount;

    if (currentVerse == 1) {
      previousChapter = currentChapter - 1;
      // if(previousVerse != 0) {
      Box<ChapterSummaryModel> chapterSummaryModelBox =
          store.box<ChapterSummaryModel>();
      QueryBuilder<ChapterSummaryModel> queryBuilder =
          chapterSummaryModelBox.query(ChapterSummaryModel_.chapterNumber
              .equals((previousChapter).toString()));
      Query<ChapterSummaryModel> query = queryBuilder.build();
      List<ChapterSummaryModel>? chapterSummaryList = query.find();
      if (chapterSummaryList.isNotEmpty) {
        previousVerse = chapterSummaryList.first.verseCount;
      }
      // }
    }

    List<ChapterDetailedModel> chapterDetailedList = [];
    if (previousChapter != 0) {
      Box<ChapterDetailedModel> chapterDetailedModelBox =
          store.box<ChapterDetailedModel>();
      QueryBuilder<ChapterDetailedModel> queryBuilder2 =
          chapterDetailedModelBox.query(ChapterDetailedModel_.verseNumber
                  .equals((previousVerse).toString()) &
              ChapterDetailedModel_.chapterNumber
                  .equals((previousChapter).toString()));
      Query<ChapterDetailedModel> query2 = queryBuilder2.build();
      chapterDetailedList = query2.find();
    }
    return chapterDetailedList;
  }

  void addBookmark(ChapterDetailedModel verseDetails) {
    Store store = databaseService.getStore()!;
    DateTime currentDateTime = DateTime.now();
    Box<VerseBookmarkModel> VerseBookmarkModelBox =
        store.box<VerseBookmarkModel>();

    Box<VerseBookmarkModel> verseBookmarkModelBox =
        store.box<VerseBookmarkModel>();
    QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
        VerseBookmarkModel_.verseNumber.equals(verseDetails.verseNumber) &
            VerseBookmarkModel_.chapterNumber
                .equals(verseDetails.chapterNumber));
    Query<VerseBookmarkModel> query = queryBuilder.build();
    List<VerseBookmarkModel>? bookmarkList = query.find();
    // debugPrint("Bookmark List length: ${bookmarkList.length}");
    if (bookmarkList.isEmpty) {
      // <--- add bookmark to the table as it is not present already --->
      VerseBookmarkModelBox.put(VerseBookmarkModel(
          verseNumber: verseDetails.verseNumber,
          chapterNumber: verseDetails.chapterNumber,
          text: verseDetails.text,
          transliteration: verseDetails.transliteration,
          wordMeanings: verseDetails.wordMeanings,
          translation: verseDetails.translation,
          commentary: verseDetails.commentary,
          verseNumberInt: verseDetails.verseNumberInt,
          creationTime: currentDateTime.microsecondsSinceEpoch));
    }
  }

  void removeBookmark(ChapterDetailedModel verseDetails) {
    Store store = databaseService.getStore()!;
    Box<VerseBookmarkModel> verseBookmarkModelBox =
        store.box<VerseBookmarkModel>();
    QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
        VerseBookmarkModel_.verseNumber.equals(verseDetails.verseNumber) &
            VerseBookmarkModel_.chapterNumber
                .equals(verseDetails.chapterNumber));
    Query<VerseBookmarkModel> query = queryBuilder.build();
    List<VerseBookmarkModel>? bookmarkList = query.find();

    // debugPrint("Bookmark to be removed: ${bookmarkList[0].id}");
    // debugPrint(
    //     "Bookmark length before removal: ${verseBookmarkModelBox.count()}");

    verseBookmarkModelBox.remove(bookmarkList[0].id);
    // debugPrint(
    //     "Bookmark length after removal: ${verseBookmarkModelBox.count()}");
  }
}
