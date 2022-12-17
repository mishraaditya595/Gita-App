
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';

import '../../objectbox.dart';
import '../../objectbox.g.dart';

class ChapterScreen extends StatefulWidget {

  final int chapterNumber;
  final String chapterName;
  final String chapterSummary;

  const ChapterScreen({Key? key, required this.chapterNumber, required this.chapterName, required this.chapterSummary}) : super(key: key);


  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {

  int? chapterSummaryLines = 4;
  bool isNotExpanded = true;
  String expandSummaryText = "READ MORE";
  ScrollController? _controller;
  List<ChapterDetailedModel> chapterDetailedList = [];

  @override
  void initState() {
    setState(() {
      isNotExpanded = true;
      expandSummaryText = "READ MORE";
    });
    fetchChapterDetails();
    _controller = ScrollController();
    _controller?.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.chapterNumber}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
        child: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(widget.chapterName.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Visibility(
                  visible: isNotExpanded,
                  child: Text(
                    widget.chapterSummary,
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Visibility(
                  visible: !isNotExpanded,
                  child: Text(
                    widget.chapterSummary,),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () => inflateChapterSummary(),
                      child: Text(expandSummaryText)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Flexible(
              child: GestureDetector(

                child: ListView.builder(
                    controller: _controller,
                    itemCount: chapterDetailedList.length,
                    itemBuilder: (context, position) {
                      return VerseCardWidget(
                        verseDetails: ChapterDetailedModel(
                            verseNumber: chapterDetailedList[position].verseNumber,
                            chapterNumber: chapterDetailedList[position].chapterNumber,
                            text: chapterDetailedList[position].text,
                            transliteration: chapterDetailedList[position].transliteration,
                            wordMeanings: chapterDetailedList[position].wordMeanings,
                            translation: chapterDetailedList[position].translation,
                            commentary: chapterDetailedList[position].commentary,
                            verseNumberInt: chapterDetailedList[position].verseNumberInt,
                        ),

                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  inflateChapterSummary() {
    setState(() {
      if (isNotExpanded) {
        isNotExpanded = false;
        expandSummaryText = "SHOW LESS";
      } else {
        isNotExpanded = true;
        expandSummaryText = "READ MORE";
      }
    });
  }

  scrollListener() {
    setState(() {
      isNotExpanded = true;
      expandSummaryText = "READ MORE";
    });
  }

  Future<void> fetchChapterDetails() async {
    Store store = await ObjectBox().getStore();
    Box<ChapterDetailedModel> chapterDetailedModelBox = store.box<
        ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        .query(
        ChapterDetailedModel_.chapterNumber.equals("${widget.chapterNumber}"))
      ..order(ChapterDetailedModel_.verseNumberInt);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? _chapterDetailedList = query.find();

    setState(() {
      chapterDetailedList.addAll(_chapterDetailedList);
    });
    store.close();
  }
}
