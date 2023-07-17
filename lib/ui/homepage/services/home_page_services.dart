import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class HomePageServices {
  DatabaseService databaseService;

  HomePageServices(this.databaseService);

  //<--- get all chapters summary --->
  Future<List<ChapterSummaryModel>> getAllChapters() async {
    Isar isar = databaseService.getStore()!;
    List<ChapterSummaryModel> chapterSummaryList = await isar.chapterSummaryModels.where().findAll();
    return chapterSummaryList;
  }

  //<--- get last read verse --->
  Future<List<LastReadModel>> getLastReadVerse() async{
    // Store store = databaseService.getStore()!;
    // Box<ChapterDetailedModel> chapterDetailedModelBox =
    //     store.box<ChapterDetailedModel>();
    // Box<LastReadModel> lastReadModelBox = store.box<LastReadModel>();
    // List<LastReadModel> lastReadList = lastReadModelBox.getAll();

    Isar isar = databaseService.getStore()!;
    List<LastReadModel> lastReadList = await isar.lastReadModels.where().findAll();
    return lastReadList;
  }

  Future<List<ChapterDetailedModel>> getChapterDetailedList(
      int chapterNumber, int verseNumber) async {
    // Store store = databaseService.getStore()!;
    // Box<ChapterDetailedModel> chapterDetailedModelBox =
    //     store.box<ChapterDetailedModel>();
    // QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
    //     .query(ChapterDetailedModel_.chapterNumber.equals("$chapterNumber") &
    //         ChapterDetailedModel_.verseNumber.equals("$verseNumber"))
    //   ..order(ChapterDetailedModel_.verseNumberInt);
    // Query<ChapterDetailedModel> query = queryBuilder.build();
    // List<ChapterDetailedModel>? queryList = query.find();

    Isar isar = databaseService.getStore()!;
    List<ChapterDetailedModel> chapterDetailedList = await isar.chapterDetailedModels
        .filter()
        .chapterNumberEqualTo("$chapterNumber")
        .verseNumberEqualTo("$verseNumber")
        .findAll();
    return chapterDetailedList;
  }
}
