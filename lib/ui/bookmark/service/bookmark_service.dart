import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../models/verse_bookmark_model.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class BookmarkService {
  DatabaseService databaseService;

  BookmarkService(this.databaseService);

  Future<List<VerseBookmarkModel>> fetchAllBookmarks() async {
    Isar isar = databaseService.getStore()!;
    List<VerseBookmarkModel> verseBookmarkModelList = await isar.verseBookmarkModels.where().findAll();
    return verseBookmarkModelList;
  }

  Future<List<VerseBookmarkModel>> removeBookmark(String verseNumber, String chapterNumber) async {
    Isar isar = databaseService.getStore()!;

    await isar.verseBookmarkModels.filter()
        .verseNumberEqualTo(verseNumber)
        .and()
    .chapterNumberEqualTo(chapterNumber).deleteAll();

    List<VerseBookmarkModel> bookmarkList = await isar.verseBookmarkModels.where().findAll();

    return bookmarkList;
  }

}