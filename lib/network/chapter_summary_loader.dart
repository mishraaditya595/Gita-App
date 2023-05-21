import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/objectbox.dart';
import 'package:sbg/utils/global_variables.dart';

import '../utils/constants.dart';

class ChapterSummaryLoader {

  final String tableName = "chapter_summary";

  getDataFromDB() async {

    http.Response res = await http.get(
        Uri.parse('${Constants.SUPABASE_URI}rest/v1/$tableName?select=*'),
        headers: {
          'Authorization': Constants.SUPABASE_AUTHORIZATION,
          'apikey': Constants.SUPABASE_API_KEY
        });

    addDataToLocalDb(res);
  }

  Future<void> addDataToLocalDb(Response res) async {
    Store store = GlobalVariables.store ?? await ObjectBox().getStore();
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
      // store.close();
    }
  }

  ChapterSummaryModel toChapterSummaryModel(chapterSummary) {
    ChapterSummaryModel chapterSummaryModel = ChapterSummaryModel(
        chapterNumber: chapterSummary['chapter_number'].toString().trim() ?? '',
        name: chapterSummary['name'].toString().trim() ??'',
        nameTranslated: chapterSummary['name_translated'].toString().trim() ??'',
        verseCount: chapterSummary['verses_count'].toInt() ?? -1,
        nameMeaning: chapterSummary['name_meaning'].toString().trim() ?? '',
        summary: chapterSummary['summary'].toString().trim() ?? '',
        summaryHindi: chapterSummary['summary_hindi'].toString().trim() ?? '',
        chapterNumberInt: chapterSummary['chapter_number'] ?? 0
    );
    return chapterSummaryModel;
  }
}