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
  bool loading = false;

  Future<void> fetchAll() async {
    changeLoadingState();
    HomePageServices homePageServices = GetIt.instance.get<HomePageServices>();
    chapterSummaryList = await homePageServices.getAllChapters();

    List<LastReadModel> lastReadList = await homePageServices.getLastReadVerse();

    if (lastReadList.isNotEmpty) {
      // debugPrint("Last Read Found: ${lastReadList[0].lastReadVerseText}");
      lastReadVerseText = lastReadList[0].lastReadVerseText ?? "";
      lastReadVerseNum = lastReadList[0].lastReadVerseNum ?? "";
      isLastReadAvailable = true;
      lastReadChapterInt = lastReadList.first.chapterNumber ?? 0;
      lastReadVerseInt = lastReadList.first.verseNumber ?? 0;

      List<ChapterDetailedModel>? queryList = await
          homePageServices.getChapterDetailedList(
              lastReadList[0].chapterNumber ?? 0, lastReadList[0].verseNumber ?? 0);
      chapterDetailedList.addAll(queryList);
    }
    changeLoadingState();
  }

  void changeLoadingState() {
    loading = !loading;
    notifyListeners();
  }
}
