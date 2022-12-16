import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

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

  @override
  void initState() {
    // fetchVerseDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verse ${widget.chapterNumber}.${widget.verseNumber}"),
        centerTitle: true,
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

  Future<void> fetchVerseDetails() async {
    Store store = await ObjectBox().getStore();
    // List<ChapterDetailedModel> _chapterDetailedList = store.box<ChapterDetailedModel>().getAll();
    Box<ChapterDetailedModel> chapterDetailedModelBox = store.box<ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        .query(
        ChapterDetailedModel_.chapterNumber.equals("${widget.chapterNumber}") &
        ChapterDetailedModel_.verseNumber.equals("${widget.verseNumber}")
    )
      ..order(ChapterDetailedModel_.verseNumber);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? _chapterDetailedList = query.find();
    setState(() {
      verseList.addAll(_chapterDetailedList);
    });
    store.close();
  }
}
