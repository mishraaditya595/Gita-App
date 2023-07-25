import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/ui/widgets/book_card_widget.dart';
import 'package:sbg/ui/widgets/default_app_bar.dart';

import '../../../utils/hexcolor.dart';
import '../../libraryhome/services/library_services.dart';
import '../../widgets/book_count_widget.dart';
import '../../widgets/library_book_card_widget.dart';

class LibraryPage extends StatefulWidget {
  static const String routeName = "/library";
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  List<BooksModel> booksModelList = [];

  @override
  void initState() {
    LibraryService libraryService = GetIt.instance.get<LibraryService>();
    booksModelList = libraryService.getAllBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Library"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCountWidget(
              bookCount: 4,
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: booksModelList.length < 3 ? booksModelList.length : 3,
                mainAxisExtent: 230,
              ),
              physics: const ClampingScrollPhysics(),
              itemCount: booksModelList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return LibraryBookCardWidget(booksModel: booksModelList[index],);
              },
            ),

          ],
        ),
      ),
    );
  }
}
