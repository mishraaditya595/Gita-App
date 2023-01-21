import 'dart:developer';
import 'dart:math';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/daily_darshan_model.dart';
import 'package:sbg/objectbox.dart';
import 'package:sbg/ui/screens/verse_screen.dart';
import 'package:sbg/ui/widgets/chapter_card_widget.dart';

import '../../models/chapter_detailed_model.dart';
import '../../models/chapter_summary_model.dart';
import '../../models/last_read_model.dart';
import '../../objectbox.g.dart';
import 'package:device_information/device_information.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChapterSummaryModel> chapterSummaryList = [];
  List<ChapterDetailedModel> chapterDetailedList = [];
  List<String> verseOfTheDay = [];
  List<String> dailyDarshanImageFiles = [];
  String lastReadVerseText = "";
  String lastReadVerseNum = "";
  int lastReadChapterInt = 0;
  int lastReadVerseInt = 0;
  bool isLastReadAvailable = false;
  bool isInternetAvailable = false;

  @override
  void initState() {
    fetchData();
    checkNetworkConnectivity();
    super.initState();
  }

  checkNetworkConnectivity() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      setState(() {
        isInternetAvailable = true;
      });
      debugPrint('Internet connection available!');
    } else {
      setState(() {
        isInternetAvailable = false;
      });
      debugPrint('No internet :(');
    }
  }

  getImei() async {
    try {
      String imeiNo = await DeviceInformation.deviceIMEINumber;
      debugPrint("Imei: $imeiNo");
    } catch (e) {
      debugPrint("E: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: double.maxFinite,
                child: InkWell(
                  onTap: () async => {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 3,
                    child: InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: isInternetAvailable
                            ? Carousel(
                                dotSize: 4.0,
                                dotSpacing: 15.0,
                                indicatorBgPadding: 5.0,
                                borderRadius: true,
                                overlayShadow: true,
                                animationDuration:
                                    const Duration(milliseconds: 500),
                                autoplayDuration: const Duration(seconds: 5),
                                images: dailyDarshanImageFiles.length !=0
                                    ? dailyDarshanImageFiles.map<Widget>((e) =>
                                    Image.network(
                                      e,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topCenter,
                                    )).toList()
                                    : [ const AssetImage("assets/images/krishna.jpg"),],
                                // images: [
                                //   for(int i = 0; i < dailyDarshanImageFiles.length; i++){
                                //     Image.network(
                                //       dailyDarshanImageFiles[i],
                                //       fit: BoxFit.cover,
                                //       alignment: Alignment.topCenter,
                                //     ),
                                //   },
                                //   // Image.network(
                                //   //   "https://firebasestorage.googleapis.com/v0/b/opinionpoll-cb453.appspot.com/o/WhatsApp%20Image%202023-01-14%20at%2009.14.13.jpeg?alt=media&token=2ff29db6-4f59-4a72-a37d-e1728f0f5310",
                                //   //   fit: BoxFit.cover,
                                //   //   alignment: Alignment.topCenter,
                                //   // ),
                                //   // Image.network(
                                //   //   "https://firebasestorage.googleapis.com/v0/b/gita-237e4.appspot.com/o/files%2Fdaily_darshan%2FWhatsApp%20Image%202023-01-14%20at%2009.14.13.jpeg?alt=media&token=6f658e58-4b5f-400c-a7a6-ff860f378ac0",
                                //   //   fit: BoxFit.cover,
                                //   //   alignment: Alignment.topCenter,
                                //   // ),
                                //   // Image.network(
                                //   //   "https://firebasestorage.googleapis.com/v0/b/gita-237e4.appspot.com/o/files%2Fdaily_darshan%2FWhatsApp%20Image%202023-01-17%20at%2011.40.20.jpeg?alt=media&token=6eae2c85-915e-48bf-9189-f8c746b017db",
                                //   //   fit: BoxFit.cover,
                                //   //   alignment: Alignment.topCenter,
                                //   // ),
                                //   // Image.network(
                                //   //   "https://firebasestorage.googleapis.com/v0/b/gita-237e4.appspot.com/o/files%2Fdaily_darshan%2FWhatsApp%20Image%202023-01-13%20at%2009.31.59.jpeg?alt=media&token=bbdee1da-e8b0-499a-ac8b-a1c2c00ff0f5",
                                //   //   fit: BoxFit.cover,
                                //   //   alignment: Alignment.topCenter,
                                //   // ),
                                // ],
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/krishna.jpg"),
                                      fit: BoxFit.fill,
                                      alignment: Alignment.topCenter,
                                    )),
                              ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () =>
                            onCardTapped(lastReadChapterInt, lastReadVerseInt),
                        child: const Text("CONTINUE READING")),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "CHAPTERS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.sort_sharp))
                ],
              ),
              chapterSummaryList.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: chapterSummaryList.length,
                      itemBuilder: (context, position) {
                        return ChapterWidgetCard(
                          chapterNumber: position + 1,
                          chapterName:
                              chapterSummaryList[position].nameTranslated,
                          verseCount: chapterSummaryList[position].verseCount,
                          chapterSummary: chapterSummaryList[position].summary,
                        );
                      })
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Could not load chapter data from server.\nPlease check your internet connection and reload the app.",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    )
            ],
          ),
        ),
      ]),
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
    Box<ChapterSummaryModel> chapterSummaryModelBox =
        store.box<ChapterSummaryModel>();
    QueryBuilder<ChapterSummaryModel> queryBuilder = chapterSummaryModelBox
        .query()
      ..order(ChapterSummaryModel_.chapterNumberInt);
    Query<ChapterSummaryModel> query = queryBuilder.build();
    List<ChapterSummaryModel> _chapterSummaryList = query.find();

    //<--- get random verse --->
    Box<ChapterDetailedModel> chapterDetailedModelBox =
        store.box<ChapterDetailedModel>();

    // Random random = Random();
    // int randomChapterNumber = random.nextInt(18) + 1;
    // int randomVerseNumber = random.nextInt(20) + 1;
    //
    // QueryBuilder<ChapterDetailedModel> _queryBuilder = chapterDetailedModelBox
    //     .query(
    //         ChapterDetailedModel_.chapterNumber.equals("$randomChapterNumber") &
    //             ChapterDetailedModel_.verseNumber.equals("$randomVerseNumber"))
    //   ..order(ChapterDetailedModel_.verseNumberInt);
    // Query<ChapterDetailedModel> _query = _queryBuilder.build();
    // List<ChapterDetailedModel>? queryList = _query.find();

    //<--- get last read verse --->
    Box<LastReadModel> lastReadModelBox = store.box<LastReadModel>();
    List<LastReadModel> lastReadList = lastReadModelBox.getAll();

    //<--- get last read verse --->
    Box<DailyDarshanModel> dailyDarshanBox = store.box<DailyDarshanModel>();
    QueryBuilder<DailyDarshanModel> _query = dailyDarshanBox.query()..order(DailyDarshanModel_.timestamp, flags: Order.descending);
    List<DailyDarshanModel> dailyDarshanList = _query.build().find();

    debugPrint("Daily darshan files: ${dailyDarshanList.first.filesList}");

    setState(() {
      // verseOfTheDay.add(queryList[0].translation);
      // verseOfTheDay.add(randomChapterNumber.toString());
      // verseOfTheDay.add(randomVerseNumber.toString());

      chapterSummaryList.addAll(_chapterSummaryList);
      debugPrint("Timestamp: ${dailyDarshanList.first.timestamp}");
      dailyDarshanImageFiles.addAll(dailyDarshanList.first.filesList);

      // debugPrint("VerseOfTheDay: ${queryList[0].translation}");
      // debugPrint("VerseOfTheDay: ${queryList[0].chapterNumber}");
      // debugPrint("VerseOfTheDay: ${queryList[0].verseNumber}");
      // debugPrint("Random verse num: $randomChapterNumber.$randomVerseNumber");

      if (lastReadList.isNotEmpty) {
        debugPrint("Last Read Found: ${lastReadList[0].lastReadVerseText}");
        lastReadVerseText = lastReadList[0].lastReadVerseText;
        lastReadVerseNum = lastReadList[0].lastReadVerseNum;
        isLastReadAvailable = true;
        lastReadChapterInt = lastReadList.first.chapterNumber;
        lastReadVerseInt = lastReadList.first.verseNumber;

        QueryBuilder<ChapterDetailedModel> queryBuilder =
            chapterDetailedModelBox.query(ChapterDetailedModel_.chapterNumber
                    .equals("${lastReadList.first.chapterNumber}") &
                ChapterDetailedModel_.verseNumber
                    .equals("${lastReadList.first.verseNumber}"))
              ..order(ChapterDetailedModel_.verseNumberInt);
        Query<ChapterDetailedModel> query = queryBuilder.build();
        List<ChapterDetailedModel>? queryList = query.find();
        chapterDetailedList.addAll(queryList);
      }
    });
    store.close();
  }
}
