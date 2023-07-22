import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../models/chapter_detailed_model.dart';
import '../services/chapter_screen_service.dart';

class ChapterScreenProvider extends ChangeNotifier {
  List<ChapterDetailedModel> chapterDetailedList = [];
  bool isNotExpanded = true;
  String expandSummaryText = "READ MORE";
  String bookHashWord = "";

  fetchAll(int chapterNumber) {
    ChapterScreenService chapterScreenService =
        GetIt.instance.get<ChapterScreenService>();
    chapterDetailedList =
        chapterScreenService.getChapterDetailedList(chapterNumber, bookHashWord);
    notifyListeners();
  }

  inflateChapterSummary() {
    if (isNotExpanded) {
      isNotExpanded = false;
      expandSummaryText = "SHOW LESS";
    } else {
      isNotExpanded = true;
      expandSummaryText = "READ MORE";
    }
    notifyListeners();
  }

  changeStateOnScroll() {
    isNotExpanded = true;
    expandSummaryText = "READ MORE";
    notifyListeners();
  }
}
