import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/objectbox.dart';

import '../utils/constants.dart';

class ChapterDetailedLoader {

  final String tableName = "chapter_detailed";

  getDataFromDB() async {

    http.Response res = await http.get(
        Uri.parse('${Constants.URI}rest/v1/$tableName?select=*'),
        headers: {
          'Authorization': Constants.AUTHORIZATION,
          'apikey': Constants.API_KEY
        });

    addDataToLocalDb(res);
  }

  Future<void> addDataToLocalDb(Response res) async {
    Store store = await ObjectBox().getStore();
    List<ChapterDetailedModel> chapterDetailedList = [];
    if(res.statusCode == 200) {
      var jsonResp = jsonDecode(res.body);
      for (int i = 0; i < jsonResp.length; i++) {
        var chapterDetailed = jsonResp[i];
        chapterDetailedList.add(toChapterDetailedModel(chapterDetailed));
      }
      store.box<ChapterDetailedModel>().removeAll();
      store.box<ChapterDetailedModel>().putMany(chapterDetailedList);
      log("Chapter Detailed Loaded: ${store.box<ChapterDetailedModel>().getAll().length}");
      store.close();
    }
  }

  ChapterDetailedModel toChapterDetailedModel(chapterDetailed) {
    ChapterDetailedModel chapterDetailedModel = ChapterDetailedModel(
        verseNumber: chapterDetailed['verse_number'].toString() ?? '',
        chapterNumber: chapterDetailed['chapter_number'].toString() ?? '',
        text: chapterDetailed['text'].toString() ?? '',
        transliteration: chapterDetailed['transliteration'].toString() ?? '',
        wordMeanings: chapterDetailed['word_meanings'].toString() ?? '',
        translation: chapterDetailed['translation'].toString() ?? '',
        commentary: chapterDetailed['commentary'].toString() ?? '',
    );
    return chapterDetailedModel;
  }
}