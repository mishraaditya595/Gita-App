import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/ui/loading/service/loading_service.dart';
import 'package:sbg/ui/widgets/chapter_card_widget.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/global_variables.dart';
import 'package:sbg/utils/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
import 'package:upgrader/upgrader.dart';
import '../../../models/chapter_detailed_model.dart';
import 'package:device_information/device_information.dart';
import 'package:provider/provider.dart';

import '../../bottombar/services/in_app_review_service.dart';
import '../../verse/screen/verse_screen.dart';
import '../../widgets/default_app_bar.dart';
import '../provider/home_page_provider.dart';

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
    GlobalVariables.homePageKey = GlobalKey<_HomePageState>();
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
            body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: widget.bookModel.bookImage,
                      width: 120,
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Visibility(
                  visible: !kIsWeb,
                  child: Center(
                        child: ElevatedButton(
                        onPressed: () {
                          String deepLink = "gitavedanta.in/share/?book=${homePageProvider.bookHashWord}";
                          String shareText = "Find ${widget.bookModel.bookName} at the GitaVedanta library.";
                          shareText += "\nLink: $deepLink";

                          Share.share(shareText);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TransparentHexColor(ColourConstants.primaryDarker, OpacityValue.highOpacity),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                        child: Container(
                          width: 160,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.share, color: Colors.white,),
                              ),
                              Text("Share the book", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        )
                  ),
                      ),
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
                        bookModel: widget.bookModel
                      );
                    })
              ],
            ),
          ),
        ])),
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
