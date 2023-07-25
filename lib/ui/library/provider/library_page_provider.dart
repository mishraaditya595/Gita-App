import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../../../models/books_model.dart';
import '../../libraryhome/services/library_services.dart';

class LibraryPageProvider extends ChangeNotifier {
  List<BooksModel> booksModelList = [];

  getAll() async {
    LibraryService libraryService = GetIt.instance.get<LibraryService>();
    booksModelList = libraryService.getAllBooks();
  }
}