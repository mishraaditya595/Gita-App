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
import 'package:shared_preferences/shared_preferences.dart';

import '../models/data_sync_model.dart';

class ChapterDetailedLoader {
  final String tableName = "chapter_detailed";

  getDataFromDB() async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;

    Box<DataSyncModel> dataSyncBox = store.box<DataSyncModel>();
    dataSyncBox.put(DataSyncModel(name: tableName, successStatus: false));

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

      await addDataToLocalDb(res);
    }
    dataSyncBox.put(DataSyncModel(name: tableName, successStatus: true));
  }

  Future<void> addDataToLocalDb(Response res) async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;
    List<ChapterDetailedModel> chapterDetailedList = [];
    if (res.statusCode == 200) {
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
      transliteration:
          chapterDetailed['transliteration'].toString().trim() ?? '',
      wordMeanings: chapterDetailed['word_meanings'].toString().trim() ?? '',
      translation: chapterDetailed['translation'].toString().trim() ?? '',
      commentary: chapterDetailed['commentary'].toString().trim() ?? '',
      verseNumberInt: chapterDetailed['verse_number'].toInt() ?? -1,
    );
    return chapterDetailedModel;
  }
}
