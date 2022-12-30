import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/models/last_read_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/chapter_detailed_model.dart';
import '../../objectbox.dart';
import '../../objectbox.g.dart';

class VerseScreen extends StatefulWidget {
  late int chapterNumber;
  late int verseNumber;
  late ChapterDetailedModel verseDetails;

  VerseScreen(
      {Key? key,
      required this.chapterNumber,
      required this.verseNumber,
      required this.verseDetails})
      : super(key: key);

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {
  List<ChapterDetailedModel> verseList = [];
  bool isBookmarked = false;
  bool isCommentaryAvailable = true;
  IconData fabIcon = Icons.bookmark_add;

  @override
  void initState() {
    fetchBookmarkAndAddToLastRead();
    if(widget.verseDetails.commentary == null || widget.verseDetails.commentary.isEmpty) {
      setState(() {
        isCommentaryAvailable = false;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScrollController listScrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Verse ${widget.verseDetails.chapterNumber}.${widget.verseDetails.verseNumber}"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: (){
              addOrRemoveBookmark(widget.verseDetails);
              var toastText = fabIcon == Icons.bookmark_add ? "Verse added to bookmarks." : "Verse removed from bookmarks.";
              showToast(toastText, context: context);
              },
              icon: Icon(fabIcon))],
      ),
      // floatingActionButton: Stack(
      //   fit: StackFit.expand,
      //   children: [
      //     Positioned(
      //       left: MediaQuery.of(context).size.width/15,
      //       bottom: MediaQuery.of(context).size.height/10,
      //       // bottom: 20,
      //       child: FloatingActionButton(
      //         heroTag: 'back',
      //         onPressed: () {
      //           navigateVerse("PREVIOUS");
      //           },
      //         backgroundColor: Colors.white,
      //         child: const Icon(
      //           Icons.arrow_left,
      //           size: 40,
      //           color: Colors.deepOrange,
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       right: MediaQuery.of(context).size.width/15,
      //       bottom: MediaQuery.of(context).size.height/10,
      //       child: FloatingActionButton(
      //         heroTag: 'next',
      //         onPressed: () {/* Do something */},
      //         backgroundColor: Colors.white,
      //         child: const Icon(
      //           Icons.arrow_right,
      //           size: 40,
      //           color: Colors.deepOrange,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView(controller: listScrollController, children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 25, right: 25, bottom: 0),
          child: Column(
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
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Visibility(
                        visible: isCommentaryAvailable,
                        child: Column(
                          children: [
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
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.orangeAccent,
                            child: IconButton(
                              onPressed: () {
                                navigateVerse("PREVIOUS");
                                if (listScrollController.hasClients) {
                                  final position = listScrollController.position.minScrollExtent;
                                  listScrollController.jumpTo(position);
                                }
                              },
                              icon: Icon(Icons.navigate_before),
                              color: Colors.white,
                            )),
                        CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.orangeAccent,
                            child: IconButton(
                              onPressed: () {
                                navigateVerse("NEXT");
                                if (listScrollController.hasClients) {
                                  final position = listScrollController.position.minScrollExtent;
                                  listScrollController.jumpTo(position);
                                }
                              },
                              icon: Icon(Icons.navigate_next),
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Future<void> addOrRemoveBookmark(ChapterDetailedModel verseDetails) async {
    Store store = await ObjectBox().getStore();
    DateTime currentDateTime = DateTime.now();
    Box<VerseBookmarkModel> VerseBookmarkModelBox =
        store.box<VerseBookmarkModel>();

    if (fabIcon == Icons.bookmark_add) {
      // <--- Bookmark to be added --->
      setState(() {
        fabIcon = Icons.bookmark_remove;
      });

      Box<VerseBookmarkModel> verseBookmarkModelBox =
          store.box<VerseBookmarkModel>();
      QueryBuilder<VerseBookmarkModel> queryBuilder =
          verseBookmarkModelBox.query(
              VerseBookmarkModel_.verseNumber.equals(verseDetails.verseNumber) &
                  VerseBookmarkModel_.chapterNumber
                      .equals(verseDetails.chapterNumber));
      Query<VerseBookmarkModel> query = queryBuilder.build();
      List<VerseBookmarkModel>? bookmarkList = query.find();
      debugPrint("Bookmark List length: ${bookmarkList.length}");
      if (bookmarkList.isEmpty) {
        // <--- add bookmark to the table as it is not present already --->
        VerseBookmarkModelBox.put(VerseBookmarkModel(
            verseNumber: verseDetails.verseNumber,
            chapterNumber: verseDetails.chapterNumber,
            text: verseDetails.text,
            transliteration: verseDetails.transliteration,
            wordMeanings: verseDetails.wordMeanings,
            translation: verseDetails.translation,
            commentary: verseDetails.commentary,
            verseNumberInt: verseDetails.verseNumberInt,
            creationTime: currentDateTime.microsecondsSinceEpoch));
      }
    } else {
      // <--- bookmark to be removed --->
      Box<VerseBookmarkModel> verseBookmarkModelBox =
          store.box<VerseBookmarkModel>();
      QueryBuilder<VerseBookmarkModel> queryBuilder =
          verseBookmarkModelBox.query(
              VerseBookmarkModel_.verseNumber.equals(verseDetails.verseNumber) &
                  VerseBookmarkModel_.chapterNumber
                      .equals(verseDetails.chapterNumber));
      Query<VerseBookmarkModel> query = queryBuilder.build();
      List<VerseBookmarkModel>? bookmarkList = query.find();

      debugPrint("Bookmark to be removed: ${bookmarkList[0].id}");
      debugPrint(
          "Bookmark length before removal: ${verseBookmarkModelBox.count()}");

      verseBookmarkModelBox.remove(bookmarkList[0].id);
      debugPrint(
          "Bookmark length after removal: ${verseBookmarkModelBox.count()}");

      setState(() {
        fabIcon = Icons.bookmark_add;
      });
    }
    store.close();
  }

  Future<void> fetchBookmarkAndAddToLastRead() async {
    // <--- fetch bookmark details --->
    Store store = await ObjectBox().getStore();
    Box<VerseBookmarkModel> verseBookmarkModelBox =
        store.box<VerseBookmarkModel>();
    QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
        VerseBookmarkModel_.verseNumber
                .equals(widget.verseDetails.verseNumber) &
            VerseBookmarkModel_.chapterNumber
                .equals(widget.verseDetails.chapterNumber));
    Query<VerseBookmarkModel> query = queryBuilder.build();
    List<VerseBookmarkModel>? bookmarkList = query.find();

    if (bookmarkList.isNotEmpty) {
      setState(() {
        fabIcon = Icons.bookmark_remove;
      });
    } else {
      setState(() {
        fabIcon = Icons.bookmark_add;
      });
    }

    // <--- add to last read --->
    Box<LastReadModel> lastReadModelBox = store.box<LastReadModel>();
    lastReadModelBox.removeAll();
    lastReadModelBox.put(LastReadModel(
      lastReadVerseText: widget.verseDetails.translation,
      lastReadVerseNum: "${widget.verseDetails.chapterNumber}.${widget.verseDetails.verseNumber}",
      verseNumber: widget.verseDetails.verseNumberInt,
      chapterNumber: int.parse(widget.verseDetails.chapterNumber),
    ));
    store.close();
  }

  Future<void> navigateVerse(String operator) async {
    Store store = await ObjectBox().getStore();

    int currentChapter = widget.chapterNumber;
    int currentVerse = widget.verseNumber;

    switch (operator) {
      case "NEXT":
        {
          int nextChapter = currentChapter;
          int nextVerse = currentVerse + 1;

          Box<ChapterSummaryModel> chapterSummaryModelBox =
              store.box<ChapterSummaryModel>();
          QueryBuilder<ChapterSummaryModel> queryBuilder =
              chapterSummaryModelBox.query(ChapterSummaryModel_.chapterNumber
                  .equals((currentChapter).toString()));
          Query<ChapterSummaryModel> query = queryBuilder.build();
          List<ChapterSummaryModel>? chapterSummaryList = query.find();
          var verseCount = chapterSummaryList.first.verseCount;

          if (verseCount == currentVerse) {
            nextChapter = currentChapter + 1;
            nextVerse = 1;
          }

          int totalChapter = store.box<ChapterSummaryModel>().getAll().length;

          if (nextChapter > totalChapter == false) {
            Box<ChapterDetailedModel> chapterDetailedModelBox =
                store.box<ChapterDetailedModel>();
            QueryBuilder<ChapterDetailedModel> queryBuilder2 =
                chapterDetailedModelBox.query(ChapterDetailedModel_.verseNumber
                        .equals((nextVerse).toString()) &
                    ChapterDetailedModel_.chapterNumber
                        .equals((nextChapter).toString()));
            Query<ChapterDetailedModel> query2 = queryBuilder2.build();
            List<ChapterDetailedModel>? chapterDetailedList = query2.find();
            setState(() {
              widget.verseDetails = chapterDetailedList[0];
              widget.chapterNumber =
                  int.parse(chapterDetailedList[0].chapterNumber);
              widget.verseNumber =
                  int.parse(chapterDetailedList[0].verseNumber);
            });
          } else {
            showToast("The End! \nHare Krishna", context: context);
          }
        }
        break;
      case "PREVIOUS":
        {
          int previousChapter = currentChapter;
          int previousVerse = currentVerse - 1;

          Box<ChapterSummaryModel> chapterSummaryModelBox =
              store.box<ChapterSummaryModel>();
          QueryBuilder<ChapterSummaryModel> queryBuilder =
              chapterSummaryModelBox.query(ChapterSummaryModel_.chapterNumber
                  .equals((previousChapter).toString()));
          Query<ChapterSummaryModel> query = queryBuilder.build();
          List<ChapterSummaryModel>? chapterSummaryList = query.find();
          // var verseCount = chapterSummaryList.first.verseCount;

          if (currentVerse == 1) {
            previousChapter = currentChapter - 1;
            Box<ChapterSummaryModel> chapterSummaryModelBox =
                store.box<ChapterSummaryModel>();
            QueryBuilder<ChapterSummaryModel> queryBuilder =
                chapterSummaryModelBox.query(ChapterSummaryModel_.chapterNumber
                    .equals((previousChapter).toString()));
            Query<ChapterSummaryModel> query = queryBuilder.build();
            List<ChapterSummaryModel>? chapterSummaryList = query.find();
            previousVerse = chapterSummaryList.first.verseCount;
          }

          int totalChapter = store.box<ChapterSummaryModel>().getAll().length;

          if (previousChapter != 0) {
            Box<ChapterDetailedModel> chapterDetailedModelBox =
                store.box<ChapterDetailedModel>();
            QueryBuilder<ChapterDetailedModel> queryBuilder2 =
                chapterDetailedModelBox.query(ChapterDetailedModel_.verseNumber
                        .equals((previousVerse).toString()) &
                    ChapterDetailedModel_.chapterNumber
                        .equals((previousChapter).toString()));
            Query<ChapterDetailedModel> query2 = queryBuilder2.build();
            List<ChapterDetailedModel>? chapterDetailedList = query2.find();
            setState(() {
              widget.verseDetails = chapterDetailedList[0];
              widget.chapterNumber =
                  int.parse(chapterDetailedList[0].chapterNumber);
              widget.verseNumber =
                  int.parse(chapterDetailedList[0].verseNumber);
            });
          } else {
            showToast("Cannot go back. You are at the beginning.",
                context: context);
          }
        }
    }

    if(widget.verseDetails.commentary == null || widget.verseDetails.commentary.isEmpty) {
      setState(() {
        isCommentaryAvailable = false;
      });
    } else {
      setState(() {
        isCommentaryAvailable = true;
      });
    }


    store.close();

    fetchBookmarkAndAddToLastRead();
  }
}
