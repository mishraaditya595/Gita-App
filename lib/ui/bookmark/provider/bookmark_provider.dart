import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/ui/bookmark/service/bookmark_service.dart';

import '../../../models/verse_bookmark_model.dart';

class BookmarkProvider with ChangeNotifier {
  bool isFirstTime = true;
  List<VerseBookmarkModel> verseBookmarkModelList = [];

  fetchAllBookmarks() async {
    BookmarkService bookmarkService = GetIt.instance.get<BookmarkService>();
    verseBookmarkModelList = await bookmarkService.fetchAllBookmarks();
    isFirstTime = false;
  }

  removeBookmark(String verseNumber, String chapterNumber) {
    BookmarkService bookmarkService = GetIt.instance.get<BookmarkService>();
    bookmarkService.removeBookmark(verseNumber, chapterNumber);
    notifyListeners();
  }

}