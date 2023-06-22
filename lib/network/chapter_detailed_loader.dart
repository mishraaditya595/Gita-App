import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/objectbox.dart';
import 'package:sbg/services/db/database_service.dart';

import '../utils/constants.dart';

class ChapterDetailedLoader {

  final String tableName = "chapter_detailed";

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
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;
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

    }
  }

  ChapterDetailedModel toChapterDetailedModel(chapterDetailed) {
    ChapterDetailedModel chapterDetailedModel = ChapterDetailedModel(
        verseNumber: chapterDetailed['verse_number'].toString().trim() ?? '',
        chapterNumber: chapterDetailed['chapter_number'].toString().trim() ?? '',
        text: chapterDetailed['text'].toString().trim() ?? '',
        transliteration: chapterDetailed['transliteration'].toString().trim() ?? '',
        wordMeanings: chapterDetailed['word_meanings'].toString().trim() ?? '',
        translation: chapterDetailed['translation'].toString().trim() ?? '',
        commentary: chapterDetailed['commentary'].toString().trim() ?? '',
        verseNumberInt: chapterDetailed['verse_number'].toInt() ?? -1,
    );
    return chapterDetailedModel;
  }
}