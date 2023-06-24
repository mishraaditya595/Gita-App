import 'package:injectable/injectable.dart';

import '../../../models/verse_bookmark_model.dart';
import '../../../objectbox.g.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class BookmarkService {
  DatabaseService databaseService;

  BookmarkService(this.databaseService);

  List<VerseBookmarkModel> fetchAllBookmarks() {
    Store store = databaseService.getStore()!;
    Box<VerseBookmarkModel> chapterDetailedModelBox =
    store.box<VerseBookmarkModel>();
    List<VerseBookmarkModel>? verseBookmarkModelList =
    chapterDetailedModelBox.getAll();

    return verseBookmarkModelList;
  }

  List<VerseBookmarkModel> removeBookmark(String verseNumber, String chapterNumber) {
    Store store = databaseService.getStore()!;
    Box<VerseBookmarkModel> verseBookmarkModelBox =
    store.box<VerseBookmarkModel>();
    QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
        VerseBookmarkModel_.verseNumber.equals(verseNumber) &
        VerseBookmarkModel_.chapterNumber.equals(chapterNumber));
    Query<VerseBookmarkModel> query = queryBuilder.build();
    List<VerseBookmarkModel>? bookmarkList = query.find();


    verseBookmarkModelBox.remove(bookmarkList[0].id);

    bookmarkList = verseBookmarkModelBox.getAll();

    return bookmarkList;
  }

}