import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class ChapterScreenService {
  DatabaseService databaseService;

  ChapterScreenService(this.databaseService);

  List<ChapterDetailedModel> getChapterDetailedList(int chapterNumber) {
    Box<ChapterDetailedModel> chapterDetailedModelBox =
        databaseService.getStore<ChapterDetailedModel>(describeEnum(DbModel.ChapterDetailedModel));

    List<ChapterDetailedModel>? chapterDetailedList = chapterDetailedModelBox.values.where(
            (element) =>
                element.chapterNumber == "$chapterNumber").toList();

    chapterDetailedList.sort((a, b) => a.verseNumberInt.compareTo(b.verseNumberInt));

    return chapterDetailedList;
  }
}
