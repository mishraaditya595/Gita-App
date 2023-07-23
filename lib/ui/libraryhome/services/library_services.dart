import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:sbg/models/books_model.dart';

import '../../../models/chapter_summary_model.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class LibraryService {
  DatabaseService databaseService;

  LibraryService(this.databaseService);

  List<BooksModel> getAllBooks() {
    Box<BooksModel> booksModelBox =
    databaseService.getStore<BooksModel>(describeEnum(DbModel.BooksModel));

    List<BooksModel> booksModelList = booksModelBox.values.toList();

    return booksModelList;
  }

  BooksModel? getBook(String bookHashName) {
    Box<BooksModel> booksModelBox =
    databaseService.getStore<BooksModel>(describeEnum(DbModel.BooksModel));

    List<BooksModel> booksModelList = booksModelBox.values
        .where((element) => element.bookHashWord == bookHashName
    ).toList();

    if(booksModelList.isNotEmpty) {
      return booksModelList.first;
    } else {
      return null;
    }
  }
}