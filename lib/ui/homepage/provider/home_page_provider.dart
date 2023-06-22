import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../models/chapter_detailed_model.dart';
import '../../../models/chapter_summary_model.dart';
import '../../../models/last_read_model.dart';
import '../services/home_page_services.dart';

class HomePageProvider with ChangeNotifier {
  List<ChapterSummaryModel> chapterSummaryList = [];
  List<ChapterDetailedModel> chapterDetailedList = [];
  String lastReadVerseText = "";
  String lastReadVerseNum = "";
  int lastReadChapterInt = 0;
  int lastReadVerseInt = 0;
  bool isLastReadAvailable = false;

  Future<void> fetchAll() async {
    HomePageServices homePageServices = GetIt.instance.get<HomePageServices>();
    chapterSummaryList = homePageServices.getAllChapters();

    List<LastReadModel> lastReadList = homePageServices.getLastReadVerse();

    if (lastReadList.isNotEmpty) {
      // debugPrint("Last Read Found: ${lastReadList[0].lastReadVerseText}");
      lastReadVerseText = lastReadList[0].lastReadVerseText;
      lastReadVerseNum = lastReadList[0].lastReadVerseNum;
      isLastReadAvailable = true;
      lastReadChapterInt = lastReadList.first.chapterNumber;
      lastReadVerseInt = lastReadList.first.verseNumber;

      List<ChapterDetailedModel>? queryList = homePageServices.getChapterDetailedList(lastReadList[0].chapterNumber, lastReadList[0].verseNumber);
      chapterDetailedList.addAll(queryList);
    }

    notifyListeners();
  }
}
