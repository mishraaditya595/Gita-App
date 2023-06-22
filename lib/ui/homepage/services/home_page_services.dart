import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../../../objectbox.g.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class HomePageServices {
  DatabaseService databaseService;

  HomePageServices(this.databaseService);

  //<--- get all chapters summary --->
  List<ChapterSummaryModel> getAllChapters() {
    Store store = databaseService.getStore()!;
    Box<ChapterSummaryModel> chapterSummaryModelBox =
    store.box<ChapterSummaryModel>();
    QueryBuilder<ChapterSummaryModel> queryBuilder = chapterSummaryModelBox
        .query()
      ..order(ChapterSummaryModel_.chapterNumberInt);
    Query<ChapterSummaryModel> query = queryBuilder.build();
    List<ChapterSummaryModel> chapterSummaryList = query.find();
    return chapterSummaryList;
  }

  //<--- get last read verse --->
  List<LastReadModel> getLastReadVerse() {
    Store store = databaseService.getStore()!;
    Box<ChapterDetailedModel> chapterDetailedModelBox =
    store.box<ChapterDetailedModel>();
    Box<LastReadModel> lastReadModelBox = store.box<LastReadModel>();
    List<LastReadModel> lastReadList = lastReadModelBox.getAll();
    return lastReadList;
  }

  List<ChapterDetailedModel> getChapterDetailedList(int chapterNumber, int verseNumber) {
    Store store = databaseService.getStore()!;
    Box<ChapterDetailedModel> chapterDetailedModelBox =
    store.box<ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder =
    chapterDetailedModelBox.query(ChapterDetailedModel_.chapterNumber
        .equals("$chapterNumber") &
    ChapterDetailedModel_.verseNumber
        .equals("$verseNumber"))
      ..order(ChapterDetailedModel_.verseNumberInt);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? queryList = query.find();

    return queryList;
  }

}