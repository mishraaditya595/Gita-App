import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:isar/isar.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/models/data_sync_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/db/database_service.dart';

class ChapterSummaryLoader {
  final String tableName = "chapter_summary";

  getDataFromDB() async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Isar isar = databaseService.getStore()!;


    var dataSyncModel = DataSyncModel()
      ..name = tableName
      ..successStatus = false;

    await isar.writeTxn(() async {
      await isar.dataSyncModels.put(dataSyncModel);
    });

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
    dataSyncModel = DataSyncModel()
      ..name = tableName
      ..successStatus = true;

    await isar.writeTxn(() async {
      await isar.dataSyncModels.put(dataSyncModel);
    });  }

  Future<void> addDataToLocalDb(Response res) async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Isar isar = databaseService.getStore()!;
    List<ChapterSummaryModel> chapterSummaryList = [];
    if (res.statusCode == 200) {
      await isar.chapterSummaryModels.clear();
      var jsonResp = jsonDecode(res.body);
      for (int i = 0; i < jsonResp.length; i++) {
        var chapterSummary = jsonResp[i];
        chapterSummaryList.add(toChapterSummaryModel(chapterSummary));
      }
      // store.box<ChapterSummaryModel>().removeAll();
      // store.box<ChapterSummaryModel>().putMany(chapterSummaryList);
      await isar.writeTxn(() async {
        await isar.chapterSummaryModels.putAll(chapterSummaryList);
      });
      log("Chapter Summary Loaded: ${isar.chapterSummaryModels.count()}");
    }
  }

  ChapterSummaryModel toChapterSummaryModel(chapterSummary) {
    var chapterSummaryModel = ChapterSummaryModel()
    ..chapterNumber = chapterSummary['chapter_number'].toString().trim() ?? ''
    ..name = chapterSummary['name'].toString().trim() ?? ''
    ..nameTranslated = chapterSummary['name_translated'].toString().trim() ?? ''
    ..verseCount = chapterSummary['verses_count'].toInt() ?? -1
    ..nameMeaning = chapterSummary['name_meaning'].toString().trim() ?? ''
    ..summary = chapterSummary['summary'].toString().trim() ?? ''
    ..summaryHindi = chapterSummary['summary_hindi'].toString().trim() ?? ''
    ..chapterNumberInt = chapterSummary['chapter_number'] ?? 0;

    return chapterSummaryModel;
  }
}
