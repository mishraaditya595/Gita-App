import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class HomePageServices {
  DatabaseService databaseService;

  HomePageServices(this.databaseService);

  //<--- get all chapters summary --->
  List<ChapterSummaryModel> getAllChapters(String bookHashWord) {
    Box<ChapterSummaryModel> chapterSummaryModelBox =
    databaseService.getStore<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));

    List<ChapterSummaryModel> list = chapterSummaryModelBox.values.where((element) => element.bookHashName == bookHashWord).toList();

    list.sort((a, b) => a.chapterNumberInt.compareTo(b.chapterNumberInt));
    
    return list;
  }

  ChapterSummaryModel? getChapterSummary(String chapterNum, String bookHashWord) {
    Box<ChapterSummaryModel> chapterSummaryModelBox =
    databaseService.getStore<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));

    List<ChapterSummaryModel> list = chapterSummaryModelBox.values.where((element) => element.bookHashName == bookHashWord && element.chapterNumber == chapterNum).toList();

    if(list.isNotEmpty) {
      return list.first;
    } else {
      return null;
    }
  }

  //<--- get last read verse --->
  List<LastReadModel> getLastReadVerse(String bookName) {
    
    Box<LastReadModel> lastReadModelBox =
        databaseService.getStore<LastReadModel>(describeEnum(DbModel.LastReadModel));

    List list = lastReadModelBox.values.toList();

    List<LastReadModel> lastReadList = lastReadModelBox.values.where(
            (element) =>
                element.bookHashName == bookName
    ).toList();

    return lastReadList;
  }

  List<ChapterDetailedModel> getChapterDetailedList(
      int chapterNumber, int verseNumber) {
    Box<ChapterDetailedModel> chapterDetailedModelBox =
        databaseService.getStore<ChapterDetailedModel>(describeEnum(DbModel.ChapterDetailedModel));

    List<ChapterDetailedModel>? queryList = chapterDetailedModelBox.values.where(
            (element) =>
                element.verseNumber == "$verseNumber" &&
                element.chapterNumber == "$chapterNumber").toList();

    return queryList;
  }
}
