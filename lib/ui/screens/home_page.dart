import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/objectbox.dart';
import 'package:sbg/ui/screens/verse_screen.dart';
import 'package:sbg/ui/widgets/chapter_card_widget.dart';

import '../../models/chapter_detailed_model.dart';
import '../../models/chapter_summary_model.dart';
import '../../models/last_read_model.dart';
import '../../objectbox.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChapterSummaryModel> chapterSummaryList = [];
  List<ChapterDetailedModel> chapterDetailedList = [];
  List<String> verseOfTheDay = [];
  String lastReadVerseText = "";
  String lastReadVerseNum = "";
  bool isLastReadAvailable = false;

  @override
  void initState() {
    // fetchChapterSummary();
    // fetchVerseOfTheDayAndLastRead();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 170,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image:
                            AssetImage("assets/images/temp_radha_krishna.jpeg"),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "VERSE OF THE DAY",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(
                            verseOfTheDay[0],
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.fade,
                            // softWrap: true,
                            maxLines: 4,
                            // textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () => onCardTapped(
                                int.parse(verseOfTheDay[1]),
                                int.parse(verseOfTheDay[2])),
                            child: const Text(
                              "READ MORE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isLastReadAvailable,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "LAST READ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Verse: ${lastReadVerseNum}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    lastReadVerseText,
                    style: const TextStyle(color: Colors.black),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  )
                ],
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // InkWell(
            //     onTap: () => onCardTapped(1, 1),
            //     child: const Text("CONTINUE READING")),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "CHAPTERS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.sort_sharp))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: chapterSummaryList.length,
                  itemBuilder: (context, position) {
                    return ChapterWidgetCard(
                      chapterNumber: position + 1,
                      chapterName: chapterSummaryList[position].nameTranslated,
                      verseCount: chapterSummaryList[position].verseCount,
                      chapterSummary: chapterSummaryList[position].summary,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  onCardTapped(int chapterNumber, int verseNumber) {
    debugPrint("$chapterNumber.$verseNumber");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerseScreen(
                  chapterNumber: chapterNumber,
                  verseNumber: verseNumber,
                  verseDetails: ChapterDetailedModel(
                    verseNumber: chapterDetailedList[0].verseNumber,
                    chapterNumber: chapterDetailedList[0].chapterNumber,
                    text: chapterDetailedList[0].text,
                    transliteration: chapterDetailedList[0].transliteration,
                    wordMeanings: chapterDetailedList[0].wordMeanings,
                    translation: chapterDetailedList[0].translation,
                    commentary: chapterDetailedList[0].commentary,
                    verseNumberInt: chapterDetailedList[0].verseNumberInt,
                  ),
                )));
  }

  Future<void> fetchData() async {
    Store store = await ObjectBox().getStore();

    //<--- get all chapters summary --->
    List<ChapterSummaryModel> _chapterSummaryList =
        store.box<ChapterSummaryModel>().getAll();

    //<--- get random verse --->
    Box<ChapterDetailedModel> chapterDetailedModelBox =
        store.box<ChapterDetailedModel>();

    Random random = Random();
    int randomChapterNumber = random.nextInt(18) + 1;
    int randomVerseNumber = random.nextInt(20) + 1;

    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        .query(
            ChapterDetailedModel_.chapterNumber.equals("$randomChapterNumber") &
                ChapterDetailedModel_.verseNumber.equals("$randomVerseNumber"))
      ..order(ChapterDetailedModel_.verseNumberInt);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? queryList = query.find();

    //<--- get last read verse --->
    Box<LastReadModel> lastReadModelBox = store.box<LastReadModel>();
    List<LastReadModel> lastReadList = lastReadModelBox.getAll();

    setState(() {
      verseOfTheDay.add(queryList[0].translation);
      verseOfTheDay.add(randomChapterNumber.toString());
      verseOfTheDay.add(randomVerseNumber.toString());

      chapterSummaryList.addAll(_chapterSummaryList);

      chapterDetailedList.addAll(queryList);

      // debugPrint("VerseOfTheDay: ${queryList[0].translation}");
      // debugPrint("VerseOfTheDay: ${queryList[0].chapterNumber}");
      // debugPrint("VerseOfTheDay: ${queryList[0].verseNumber}");
      debugPrint("Random verse num: $randomChapterNumber.$randomVerseNumber");


      if (lastReadList.isNotEmpty) {
        debugPrint("Last Read Found: ${lastReadList[0].lastReadVerseText}");
        lastReadVerseText = lastReadList[0].lastReadVerseText;
        lastReadVerseNum = lastReadList[0].lastReadVerseNum;
        isLastReadAvailable = true;
      }
    });
    store.close();
  }
}
