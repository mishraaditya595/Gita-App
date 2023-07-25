import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/books_model.dart';
import 'book_card_widget.dart';

class LibraryBookCardWidget extends StatelessWidget {

  BooksModel booksModel;

  LibraryBookCardWidget({Key? key, required this.booksModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 120,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: BookCardWidget(bookMap: booksModel),
    );
  }
}
