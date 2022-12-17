import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';

import '../../objectbox.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  List<VerseBookmarkModel> verseBookmarkModelList = [];

  @override
  void initState() {
    fetchAllBookmarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
        child: Column (
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text( "My Bookmarks",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: verseBookmarkModelList.length,
                  itemBuilder: (context, position) {
                    return VerseCardWidget(
                        chapterNumber: 1,
                        verseNumber: 1,
                        verseText: verseBookmarkModelList[position].translation,
                        verseDetails: ChapterDetailedModel(
                            verseNumber: verseBookmarkModelList[position].verseNumber,
                            chapterNumber: verseBookmarkModelList[position].chapterNumber,
                            text: verseBookmarkModelList[position].text,
                            transliteration: verseBookmarkModelList[position].transliteration,
                            wordMeanings: verseBookmarkModelList[position].wordMeanings,
                            translation: verseBookmarkModelList[position].translation,
                            commentary: verseBookmarkModelList[position].commentary,
                            verseNumberInt: verseBookmarkModelList[position].verseNumberInt
                        ));
              }),
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchAllBookmarks() async {
    Store store = await ObjectBox().getStore();
    Box<VerseBookmarkModel> chapterDetailedModelBox = store.box<
        VerseBookmarkModel>();
    List<VerseBookmarkModel>? _verseBookmarkModelList = chapterDetailedModelBox.getAll();

    setState(() {
      verseBookmarkModelList.addAll(_verseBookmarkModelList);
    });
    store.close();
  }
}
