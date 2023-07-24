import 'package:flutter/material.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/ui/widgets/book_card_widget.dart';
import 'package:sbg/ui/widgets/default_app_bar.dart';

import '../../../utils/hexcolor.dart';
import '../../widgets/book_count_widget.dart';

class LibraryPage extends StatefulWidget {
  static const String routeName = "/library";
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
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
                crossAxisCount: 3,
                mainAxisExtent: 230,
              ),
              physics: const ClampingScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 230,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Stack(
                    children: [
                      BookCardWidget(bookMap: BooksModel(
                          bookName: "bookName",
                          bookImage: "https://vedabase.io/media/images/en-bg_34MulJK.2e16d0ba.fill-160x254.jpg",
                          bookHashWord: "bookHashWord",
                          chapterDetailedLink: "chapterDetailedLink",
                          chapterSummaryLink: "chapterSummaryLink")),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 12, top: 12),
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              color: Colors.green,
                          ),
                          child: Text("Must Read",style: TextStyle(fontSize: 8),),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
