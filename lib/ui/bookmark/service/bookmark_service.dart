import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../models/verse_bookmark_model.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class BookmarkService {
  DatabaseService databaseService;

  BookmarkService(this.databaseService);

  List<VerseBookmarkModel> fetchAllBookmarks() {
    Box<VerseBookmarkModel> verseBookmarkModelBox =
    databaseService.getStore<VerseBookmarkModel>(describeEnum(DbModel.VerseBookmarkModel));
    List<VerseBookmarkModel>? verseBookmarkModelList =
    verseBookmarkModelBox.values.toList();

    return verseBookmarkModelList;
  }

  List<VerseBookmarkModel> removeBookmark(String verseNumber, String chapterNumber) {
    Box<VerseBookmarkModel> verseBookmarkModelBox =
    databaseService.getStore<VerseBookmarkModel>(describeEnum(DbModel.VerseBookmarkModel));

    List<VerseBookmarkModel>? bookmarkList = verseBookmarkModelBox.values.where(
            (element) =>
               element.chapterNumber == chapterNumber &&
                   element.verseNumber == verseNumber).toList();

    verseBookmarkModelBox.delete(bookmarkList[0].id);

    bookmarkList = verseBookmarkModelBox.values.toList();

    return bookmarkList;
  }

}