import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/ui/bookmark/service/bookmark_service.dart';
import 'package:sbg/ui/libraryhome/services/library_services.dart';
import 'package:collection/collection.dart';
import '../../../models/verse_bookmark_model.dart';

class BookmarkProvider with ChangeNotifier {
  bool isFirstTime = true;
  List<VerseBookmarkModel> verseBookmarkModelList = [];
  // List<String> uniqueBooks = [];
  Map<String, List<VerseBookmarkModel>> bookmarksMap = {};

  fetchAllBookmarks() async {
    BookmarkService bookmarkService = GetIt.instance.get<BookmarkService>();
    verseBookmarkModelList = bookmarkService.fetchAllBookmarks();

    LibraryService libraryService = GetIt.instance.get<LibraryService>();

    Map<String, List<VerseBookmarkModel>> convertedMap =
    groupBy(verseBookmarkModelList, (VerseBookmarkModel bookmark) => bookmark.bookHashName);

    convertedMap.forEach((bookHashName, verseBookmarkList) {
      BooksModel? booksModel = libraryService.getBook(bookHashName);
      if(booksModel != null) {
        bookmarksMap[booksModel.bookName] = verseBookmarkList;
      }
    });

    isFirstTime = false;
  }

  removeBookmark(String verseNumber, String chapterNumber) async {
    BookmarkService bookmarkService = GetIt.instance.get<BookmarkService>();
    verseBookmarkModelList = await bookmarkService.removeBookmark(verseNumber, chapterNumber);
    notifyListeners();
  }

}