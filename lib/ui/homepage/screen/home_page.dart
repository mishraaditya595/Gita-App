import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/ui/homepage/provider/home_page_provider.dart';
import 'package:sbg/ui/homepage/services/home_page_services.dart';
import 'package:sbg/ui/loading/service/loading_service.dart';
import 'package:sbg/ui/widgets/chapter_card_widget.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';
import 'package:upgrader/upgrader.dart';
import '../../../models/chapter_detailed_model.dart';
import 'package:device_information/device_information.dart';
import 'package:provider/provider.dart';

import '../../bottombar/services/in_app_review_service.dart';
import '../../verse/screen/verse_screen.dart';
import '../../widgets/default_app_bar.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/book_home";
  BooksModel bookModel;
  HomePage({Key? key, required this.bookModel}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageProvider homePageProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
      homePageProvider.bookHashWord = widget.bookModel.bookHashWord;
      homePageProvider.fetchAll();

      InAppReviewService inAppReviewService = GetIt.instance.get<InAppReviewService>();
      inAppReviewService.showReviewAlert();
    });
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
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
    homePageProvider = Provider.of<HomePageProvider>(context, listen: true);

    if (homePageProvider.loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return UpgradeAlert(
          upgrader: Upgrader(
            durationUntilAlertAgain: const Duration(minutes: 1),
            dialogStyle: UpgradeDialogStyle.material,
            showIgnore: false,
            showLater: true,),
        child: Scaffold(
          appBar: DefaultAppBar(title: widget.bookModel.bookName,),
            body: LiquidPullToRefresh(
              springAnimationDurationInMilliseconds: 300,
              color: HexColor(ColourConstants.backgroundWhite),
              backgroundColor: HexColor(ColourConstants.fiord),
              showChildOpacityTransition: false,
              onRefresh: () async {
                LoadingService loadingService = GetIt.instance.get<LoadingService>();
                await loadingService.load();
                await homePageProvider.fetchAll();
              },
              child: ListView(children: [
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
                    visible: homePageProvider.isLastReadAvailable,
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
                              "Verse: ${homePageProvider.lastReadVerseNum}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          homePageProvider.lastReadVerseText,
                          style: const TextStyle(color: Colors.black),
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () => onCardTapped(
                                homePageProvider.lastReadChapterInt,
                                homePageProvider.lastReadVerseInt,
                                homePageProvider),
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
                      itemCount: homePageProvider.chapterSummaryList.length,
                      itemBuilder: (context, position) {
                        String name = homePageProvider
                            .chapterSummaryList[position].nameTranslated;
                        int verseCount = homePageProvider
                            .chapterSummaryList[position].verseCount;
                        String chapterSummary =
                            homePageProvider.chapterSummaryList[position].summary;
                        return ChapterWidgetCard(
                          chapterNumber: position + 1,
                          chapterName: name,
                          verseCount: verseCount,
                          chapterSummary: chapterSummary,
                        );
                      })
                ],
              ),
          ),
        ]),
            )),
      );
    }
  }

  onCardTapped(
      int chapterNumber, int verseNumber, HomePageProvider homePageProvider) {
    debugPrint("$chapterNumber.$verseNumber");
    Navigator.pushNamed(
        context,
        VerseScreen.routeName,
        arguments: ChapterDetailedModel(
          verseNumber:
          homePageProvider.chapterDetailedList[0].verseNumber,
          chapterNumber:
          homePageProvider.chapterDetailedList[0].chapterNumber,
          text: homePageProvider.chapterDetailedList[0].text,
          transliteration:
          homePageProvider.chapterDetailedList[0].transliteration,
          wordMeanings:
          homePageProvider.chapterDetailedList[0].wordMeanings,
          translation:
          homePageProvider.chapterDetailedList[0].translation,
          commentary:
          homePageProvider.chapterDetailedList[0].commentary,
          verseNumberInt:
          homePageProvider.chapterDetailedList[0].verseNumberInt,
          bookHashName: '',
        )
    );
  }
}
