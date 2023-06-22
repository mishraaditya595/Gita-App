import 'package:injectable/injectable.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../objectbox.g.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class ChapterScreenService {
  DatabaseService databaseService;

  ChapterScreenService(this.databaseService);

  List<ChapterDetailedModel> getChapterDetailedList(int chapterNumber) {
    Store store = databaseService.getStore()!;
    Box<ChapterDetailedModel> chapterDetailedModelBox =
    store.box<ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        .query(ChapterDetailedModel_.chapterNumber
        .equals("$chapterNumber"))
      ..order(ChapterDetailedModel_.verseNumberInt);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? chapterDetailedList = query.find();

    return chapterDetailedList;
  }
}