import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class ChapterScreenService {
  DatabaseService databaseService;

  ChapterScreenService(this.databaseService);

  Future<List<ChapterDetailedModel>> getChapterDetailedList(int chapterNumber) async {
    Isar isar = databaseService.getStore()!;

    List<ChapterDetailedModel>? chapterDetailedList = await isar.chapterDetailedModels.filter()
        .chapterNumberEqualTo("$chapterNumber")
        .sortByVerseNumberInt()
        .findAll();

    return chapterDetailedList;
  }
}
