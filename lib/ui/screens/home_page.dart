import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/objectbox.dart';
import 'package:sbg/ui/screens/verse_screen.dart';
import 'package:sbg/ui/widgets/chapter_card_widget.dart';

import '../../models/chapter_detailed_model.dart';
import '../../models/chapter_summary_model.dart';
import '../../objectbox.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChapterSummaryModel> chapterSummaryList = [];
  List<ChapterDetailedModel> chapterDetailedList = [];
  String verseOfTheDay = "";

  @override
  void initState() {
    fetchChapterSummary();
    fetchVerseOfTheDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text(
          "Srimad Bhagwad Gita",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sync),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
        centerTitle: true,
      ),
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
                            verseOfTheDay,
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
                            onTap: () => onCardTapped(1, 1),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "LAST READ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Verse 1.11",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "1.6. The strong Yodhamanyu and the brave Uttamaujas, the sonof Subhadra (Abhimanyu, the son of Subhadra and Arjuna), and the sons ofDraupadi, all of great chariots (great heroes).",
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.fade,
              maxLines: 2,
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
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerseScreen(
                  chapterNumber: chapterNumber,
                  verseNumber: verseNumber,
                  verseDetails: ChapterDetailedModel(
                    verseNumber: chapterDetailedList[verseNumber].verseNumber,
                    chapterNumber:
                        chapterDetailedList[verseNumber].chapterNumber,
                    text: chapterDetailedList[verseNumber].text,
                    transliteration:
                        chapterDetailedList[verseNumber].transliteration,
                    wordMeanings: chapterDetailedList[verseNumber].wordMeanings,
                    translation: chapterDetailedList[verseNumber].translation,
                    commentary: chapterDetailedList[verseNumber].commentary,
                    verseNumberInt:
                        chapterDetailedList[verseNumber].verseNumberInt,
                  ),
                )));
  }

  Future<void> fetchChapterSummary() async {
    Store store = await ObjectBox().getStore();
    List<ChapterSummaryModel> _chapterSummaryList =
        store.box<ChapterSummaryModel>().getAll();
    setState(() {
      chapterSummaryList.addAll(_chapterSummaryList);
    });
    store.close();
  }

  Future<void> fetchChapterDetails() async {
    Store store = await ObjectBox().getStore();
    Box<ChapterDetailedModel> chapterDetailedModelBox =
        store.box<ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        .query(ChapterDetailedModel_.chapterNumber.equals("1"))
      ..order(ChapterDetailedModel_.verseNumberInt);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? _chapterDetailedList = query.find();

    setState(() {
      chapterDetailedList.addAll(_chapterDetailedList);
    });
    store.close();
  }

  Future<void> fetchVerseOfTheDay() async {
    Random random = Random();
    int randomChapterNumber = random.nextInt(18) + 1;
    // int verseCount = chapterSummaryList[randomChapterNumber - 1].verseCount;
    int randomVerseNumber = random.nextInt(20) + 1;

    Store store = await ObjectBox().getStore();
    Box<ChapterDetailedModel> chapterDetailedModelBox =
    store.box<ChapterDetailedModel>();
    QueryBuilder<ChapterDetailedModel> queryBuilder = chapterDetailedModelBox
        .query(
        ChapterDetailedModel_.chapterNumber.equals("$randomChapterNumber") &
        ChapterDetailedModel_.verseNumber.equals("$randomVerseNumber")
    )..order(ChapterDetailedModel_.verseNumberInt);
    Query<ChapterDetailedModel> query = queryBuilder.build();
    List<ChapterDetailedModel>? queryList = query.find();

    debugPrint("Random: $randomChapterNumber $randomVerseNumber ${queryList[0].text}");
    setState(() {
      verseOfTheDay = queryList[0].translation;
    });
    store.close();
  }
}
