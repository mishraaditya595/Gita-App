import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/ui/homepage/services/home_page_services.dart';
import 'package:sbg/ui/screens/verse_screen.dart';
import 'package:sbg/ui/widgets/chapter_card_widget.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../../../objectbox.g.dart';
import '../../../services/db/database_service.dart';
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
  String lastReadVerseText = "";
  String lastReadVerseNum = "";
  int lastReadChapterInt = 0;
  int lastReadVerseInt = 0;
  bool isLastReadAvailable = false;

  @override
  void initState() {
    super.initState();
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
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator()
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
          return ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
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
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/krishna.jpg"),
                                  fit: BoxFit.fill,
                                  alignment: Alignment.topCenter,
                                )),
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
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: chapterSummaryList.length,
                      itemBuilder: (context, position) {
                        return ChapterWidgetCard(
                          chapterNumber: position + 1,
                          chapterName: chapterSummaryList[position].nameTranslated,
                          verseCount: chapterSummaryList[position].verseCount,
                          chapterSummary: chapterSummaryList[position].summary,
                        );
                      })
                ],
              ),
            ),
          ]);
          } else {
            return const Text("Something went wrong. Restart the app!");
          }
        },
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
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    //<--- get all chapters summary --->
    HomePageServices homePageServices = GetIt.instance.get<HomePageServices>();
    List<ChapterSummaryModel> _chapterSummaryList = homePageServices.getAllChapters();

    //<--- get last read verse --->
    List<LastReadModel> lastReadList = homePageServices.getLastReadVerse();

    setState(() {

      chapterSummaryList.addAll(_chapterSummaryList);

      if (lastReadList.isNotEmpty) {
        debugPrint("Last Read Found: ${lastReadList[0].lastReadVerseText}");
        lastReadVerseText = lastReadList[0].lastReadVerseText;
        lastReadVerseNum = lastReadList[0].lastReadVerseNum;
        isLastReadAvailable = true;
        lastReadChapterInt = lastReadList.first.chapterNumber;
        lastReadVerseInt = lastReadList.first.verseNumber;

        List<ChapterDetailedModel>? queryList = homePageServices.getChapterDetailedList(lastReadList[0].chapterNumber, lastReadList[0].verseNumber);
        chapterDetailedList.addAll(queryList);
      }
    });
    await Future.delayed(const Duration(seconds: 1));
  }
}
