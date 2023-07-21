import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/ui/homepage/screen/home_page.dart';

class BookCardWidget extends StatelessWidget {
  Map bookMap;
  BookCardWidget({Key? key, required this.bookMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>
      Navigator.of(context).pushNamed(HomePage.routeName),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Image.network(
              bookMap["bookImage"],
              height: 150,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          Align(
              alignment : Alignment.center,
              child: Text(
                bookMap["bookTitle"],
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
