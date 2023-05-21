import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/objectbox.dart';
import 'package:sbg/utils/global_variables.dart';

import '../models/daily_darshan_model.dart';
import '../utils/constants.dart';

class DailyDarshanLoader {

  final String tableName = "tbl_daily_darshan";

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
    List<DailyDarshanModel> dailyDarshanList = [];
    if(res.statusCode == 200) {
      var jsonResp = jsonDecode(res.body);
      for (int i = 0; i < jsonResp.length; i++) {
        var chapterDetailed = jsonResp[i];
        dailyDarshanList.add(toChapterDetailedModel(chapterDetailed));
      }
      store.box<DailyDarshanModel>().removeAll();
      store.box<DailyDarshanModel>().putMany(dailyDarshanList);
      log("Daily Darshan Loaded: ${store.box<DailyDarshanModel>().getAll().length}");
      // store.close();
    }
  }

  DailyDarshanModel toChapterDetailedModel(data) {

    String filesStr = data['files'].substring(1, data['files'].length - 1);

    DailyDarshanModel dailyDarshan = DailyDarshanModel(
      files: data['files'] ?? '',
      timestamp: data['timestamp'] ?? 0,
      filesList: filesStr.split(", "),
    );
    return dailyDarshan;
  }
}