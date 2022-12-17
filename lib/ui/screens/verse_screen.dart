import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/last_read_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/chapter_detailed_model.dart';
import '../../objectbox.dart';
import '../../objectbox.g.dart';

class VerseScreen extends StatefulWidget {
  final int chapterNumber;
  final int verseNumber;
  final ChapterDetailedModel verseDetails;

  const VerseScreen({Key? key, required this.chapterNumber, required this.verseNumber, required this.verseDetails})
      : super(key: key);

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {

  List<ChapterDetailedModel> verseList = [];
  bool isBookmarked = false;
  IconData fabIcon = Icons.bookmark_add;

  @override
  void initState() {
    fetchBookmarkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Verse ${widget.verseDetails.chapterNumber}.${widget.verseDetails.verseNumber}"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { addOrRemoveBookmark(widget.verseDetails); },
        backgroundColor: Colors.white70,
        splashColor: Colors.orange,
        elevation: 3,
        child: Icon(fabIcon),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 15),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.verseDetails.text ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "TRANSLITERATION",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.verseDetails.transliteration ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "WORD MEANING",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.verseDetails.wordMeanings ?? '',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "TRANSLATION",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.verseDetails.translation ?? '',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.orangeAccent,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "COMMENTARY",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.verseDetails.commentary ?? '',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> addOrRemoveBookmark(ChapterDetailedModel verseDetails) async {
    Store store = await ObjectBox().getStore();
    DateTime currentDateTime = DateTime.now();
    Box<VerseBookmarkModel> VerseBookmarkModelBox = store.box<VerseBookmarkModel>();

    if(fabIcon == Icons.bookmark_add) {
      // <--- Bookmark to be added --->
      setState(() {
        fabIcon = Icons.bookmark_remove;
      });

      Box<VerseBookmarkModel> verseBookmarkModelBox = store.box<VerseBookmarkModel>();
      QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
          VerseBookmarkModel_.verseNumber.equals(verseDetails.verseNumber) &
          VerseBookmarkModel_.chapterNumber.equals(verseDetails.chapterNumber)
      );
      Query<VerseBookmarkModel> query = queryBuilder.build();
      List<VerseBookmarkModel>? bookmarkList = query.find();
      debugPrint("Bookmark List length: ${bookmarkList.length}");
      if(bookmarkList.isEmpty) {
        // <--- add bookmark to the table as it is not present already --->
        VerseBookmarkModelBox.put(
            VerseBookmarkModel(
                verseNumber: verseDetails.verseNumber,
                chapterNumber: verseDetails.chapterNumber,
                text: verseDetails.text,
                transliteration: verseDetails.transliteration,
                wordMeanings: verseDetails.wordMeanings,
                translation: verseDetails.translation,
                commentary: verseDetails.commentary,
                verseNumberInt: verseDetails.verseNumberInt,
                creationTime: currentDateTime.microsecondsSinceEpoch)
        );
      }
    } else {
      // <--- bookmark to be removed --->
      Box<VerseBookmarkModel> verseBookmarkModelBox = store.box<VerseBookmarkModel>();
      QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
          VerseBookmarkModel_.verseNumber.equals(verseDetails.verseNumber) &
          VerseBookmarkModel_.chapterNumber.equals(verseDetails.chapterNumber)
      );
      Query<VerseBookmarkModel> query = queryBuilder.build();
      List<VerseBookmarkModel>? bookmarkList = query.find();

      debugPrint("Bookmark to be removed: ${bookmarkList[0].id}");
      debugPrint("Bookmark length before removal: ${verseBookmarkModelBox.count()}");

      verseBookmarkModelBox.remove(bookmarkList[0].id);
      debugPrint("Bookmark length after removal: ${verseBookmarkModelBox.count()}");

      setState(() {
        fabIcon = Icons.bookmark_add;
      });

    }
    store.close();
  }

  Future<void> fetchBookmarkData() async {
    Store store = await ObjectBox().getStore();
    Box<VerseBookmarkModel> verseBookmarkModelBox = store.box<VerseBookmarkModel>();
    QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
        VerseBookmarkModel_.verseNumber.equals(widget.verseDetails.verseNumber) &
        VerseBookmarkModel_.chapterNumber.equals(widget.verseDetails.chapterNumber)
    );
    Query<VerseBookmarkModel> query = queryBuilder.build();
    List<VerseBookmarkModel>? bookmarkList = query.find();

    if(bookmarkList.isNotEmpty) {
      setState(() {
        fabIcon = Icons.bookmark_remove;
      });
    } else {
      setState(() {
        fabIcon = Icons.bookmark_add;
      });
    }
    store.close();
  }
}
