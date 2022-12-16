import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/objectbox.dart';

import '../utils/constants.dart';

class ChapterSummaryLoader {

  final String tableName = "chapter_summary";

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
    List<ChapterSummaryModel> chapterSummaryList = [];
    if(res.statusCode == 200) {
      var jsonResp = jsonDecode(res.body);
      for (int i = 0; i < jsonResp.length; i++) {
        var chapterSummary = jsonResp[i];
        chapterSummaryList.add(toChapterSummaryModel(chapterSummary));
      }
      store.box<ChapterSummaryModel>().removeAll();
      store.box<ChapterSummaryModel>().putMany(chapterSummaryList);
      log("Chapter Summary Loaded: ${store.box<ChapterSummaryModel>().getAll().length}");
      store.close();
    }
  }

  ChapterSummaryModel toChapterSummaryModel(chapterSummary) {
    ChapterSummaryModel chapterSummaryModel = ChapterSummaryModel(
        chapterNumber: chapterSummary['chapter_number'].toString() ?? '',
        name: chapterSummary['name'].toString() ??'',
        nameTranslated: chapterSummary['name_translated'].toString() ??'',
        verseCount: chapterSummary['verses_count'].toInt() ?? -1,
        nameMeaning: chapterSummary['name_meaning'].toString() ?? '',
        summary: chapterSummary['summary'].toString() ?? '',
        summaryHindi: chapterSummary['summary_hindi'].toString() ?? ''
    );
    return chapterSummaryModel;
  }
}