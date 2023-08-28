import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/models/data_sync_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/db/database_service.dart';

class ChapterSummaryLoader {
  // final String tableName = "chapter_summary";

  getDataFromDB(BooksModel element) async {
    String tableName = element.chapterSummaryLink;

    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();

    Box<DataSyncModel> dataSyncBox =
    databaseService.getStore<DataSyncModel>(describeEnum(DbModel.DataSyncModel));

    dataSyncBox.add(DataSyncModel(name: tableName, successStatus: false));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? baseUri = prefs.getString("SUPABASE_URI");
    String? authKey = prefs.getString("SUPABASE_AUTHORIZATION");
    String? apiKey = prefs.getString("SUPABASE_API_KEY");
    if(baseUri != null && baseUri.isNotEmpty) {
      http.Response res = await http.get(
          Uri.parse('${baseUri}rest/v1/$tableName?select=*'),
          headers: {
            'Authorization': authKey ?? "",
            'apikey': apiKey ?? ""
          });
      print("chapter summary data received from api");
      await addDataToLocalDb(res, element.bookHashWord);
    }
    dataSyncBox.add(DataSyncModel(name: tableName, successStatus: true));
  }

  Future<void> addDataToLocalDb(Response res, String bookHashWord) async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Box<ChapterSummaryModel> chapterSummaryModelBox =
    databaseService.getStore<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));

    List<ChapterSummaryModel> chapterSummaryList = [];
    if (res.statusCode == 200) {
      var jsonResp = jsonDecode(res.body);
      for (int i = 0; i < jsonResp.length; i++) {
        var chapterSummary = jsonResp[i];
        chapterSummaryList.add(toChapterSummaryModel(chapterSummary, bookHashWord));
      }
      chapterSummaryModelBox.addAll(chapterSummaryList);
      print("Chapter Summary Loaded: ${chapterSummaryModelBox.values.toList().length}");
    }
  }

  ChapterSummaryModel toChapterSummaryModel(chapterSummary, String bookHashWord) {
    ChapterSummaryModel chapterSummaryModel = ChapterSummaryModel(
        chapterNumber: chapterSummary['chapter_number'].toString().trim() ?? '',
        name: chapterSummary['name'].toString().trim() ?? '',
        nameTranslated:
            chapterSummary['name_translated'].toString().trim() ?? '',
        verseCount: chapterSummary['verses_count'].toInt() ?? -1,
        nameMeaning: chapterSummary['name_meaning'].toString().trim() ?? '',
        summary: chapterSummary['summary'].toString().trim() ?? '',
        summaryHindi: chapterSummary['summary_hindi'].toString().trim() ?? '',
        chapterNumberInt: chapterSummary['chapter_number'] ?? 0,
        bookHashName: bookHashWord);
    return chapterSummaryModel;
  }
}
