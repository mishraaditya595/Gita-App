import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/models/books_model.dart';

import '../bookhome/screen/home_page.dart';

class BookCardWidget extends StatelessWidget {
  BooksModel bookMap;
  BookCardWidget({Key? key, required this.bookMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>
      Navigator.of(context).pushNamed(HomePage.routeName, arguments: bookMap),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Image.network(
              bookMap.bookImage,
              height: 150,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          Align(
              alignment : Alignment.center,
              child: Text(
                bookMap.bookName,
                style: TextStyle(
                    fontSize: 12
                ),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
