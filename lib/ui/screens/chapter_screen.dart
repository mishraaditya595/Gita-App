
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
  Store? store = null;
  bool isNotExpanded = true;
  String expandSummaryText = "READ MORE";
  ScrollController? _controller;
  List<ChapterDetailedModel> chapterDetailedList = [];
  ChapterDetailedModel verse = ChapterDetailedModel(verseNumber: "",
      chapterNumber: "",
      text: "",
      transliteration: "",
      wordMeanings: "",
      translation: "",
      commentary: "");

  @override
  void initState() {
    setState(() {
      isNotExpanded = true;
      expandSummaryText = "READ MORE";
    });
    fetchChapterDetails();
    getStore();
    _controller = ScrollController();
    _controller?.addListener(scrollListener);
    super.initState();
  }

  getStore() async {
    setState(() async {
      store = await ObjectBox().getStore();
    });
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
                      style: const TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange),),
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
                        chapterNumber: widget.chapterNumber,
                        verseNumber: position + 1,
                        verseText: chapterDetailedList[position].translation,
                        verseDetails: ChapterDetailedModel(
                            verseNumber: chapterDetailedList[position].verseNumber,
                            chapterNumber: chapterDetailedList[position].chapterNumber,
                            text: chapterDetailedList[position].text,
                            transliteration: chapterDetailedList[position].transliteration,
                            wordMeanings: chapterDetailedList[position].wordMeanings,
                            translation: chapterDetailedList[position].translation,
                            commentary: chapterDetailedList[position].commentary,
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
    // List<ChapterDetailedModel> _chapterDetailedList = store.box<ChapterDetailedModel>().getAll();
    Box<ChapterDetailedModel> chapterDetailedModelBox = store.box<
        ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        .query(
        ChapterDetailedModel_.chapterNumber.equals("${widget.chapterNumber}"))
      ..order(ChapterDetailedModel_.verseNumber);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? _chapterDetailedList = query.find();


    setState(() {
      chapterDetailedList.addAll(_chapterDetailedList);
    });
    store.close();
  }

  getVerseDetails(int chapterNumber, int position)  {
    Box<ChapterDetailedModel>? chapterDetailedModelBox = store?.box<
        ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        !.query(
        ChapterDetailedModel_.chapterNumber.equals("$chapterNumber") &
        ChapterDetailedModel_.verseNumber.equals("${position + 1}"))
      ..order(ChapterDetailedModel_.verseNumber);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? _chapterDetailedList = query.find();

    setState(() {
    });
    ChapterDetailedModel _verse = ChapterDetailedModel(
        verseNumber: _chapterDetailedList[0].verseNumber,
        chapterNumber: _chapterDetailedList[0].chapterNumber,
        text: _chapterDetailedList[0].text,
        transliteration: _chapterDetailedList[0].transliteration,
        wordMeanings: _chapterDetailedList[0].wordMeanings,
        translation: _chapterDetailedList[0].translation,
        commentary: _chapterDetailedList[0].commentary
    );

    store?.close();
    return _verse;
  }
}
