import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/books_model.dart';
import '../models/chapter_detailed_model.dart';
import '../models/data_sync_model.dart';
import '../services/db/database_service.dart';

class BooksLoader {
  final String tableName = "book_details";

  getDataFromDB() async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();

    Box<DataSyncModel> dataSyncBox =
    databaseService.getStore<DataSyncModel>(describeEnum(DbModel.DataSyncModel));

    // dataSyncBox.add(DataSyncModel(name: tableName, successStatus: false));

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
    // dataSyncBox.add(DataSyncModel(name: tableName, successStatus: true));
  }

  Future<void> addDataToLocalDb(Response res) async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();

    Box<BooksModel> booksModelBox =
    databaseService.getStore<BooksModel>(describeEnum(DbModel.BooksModel));

    List<BooksModel> booksModelList = [];
    if (res.statusCode == 200) {
      var jsonResp = jsonDecode(res.body);
      for (int i = 0; i < jsonResp.length; i++) {
        var booksModel = jsonResp[i];
        booksModelList.add(toBooksModel(booksModel));
      }
      await booksModelBox.clear();
      booksModelBox.addAll(booksModelList);
      log("Books Loaded: ${booksModelBox.values.toList().length}");
    }
  }

  BooksModel toBooksModel(booksModel) {
    return BooksModel(
        bookName: booksModel["book_name"],
        bookImage: booksModel["book_image"],
        bookHashWord: booksModel["book_hash_word"],
        chapterDetailedLink: booksModel["chapter_detailed_link"],
        chapterSummaryLink: booksModel["chapter_summary_link"]
    );
  }


}
