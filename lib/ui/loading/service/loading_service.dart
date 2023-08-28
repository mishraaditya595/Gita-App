import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/models/data_sync_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/books_model.dart';
import '../../../network/books_loader.dart';
import '../../../network/chapter_detailed_loader.dart';
import '../../../network/chapter_summary_loader.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class LoadingService {
  DatabaseService databaseService;

  LoadingService(this.databaseService);

  Future<bool> fetchAllLoaders() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? lastModifiedTime = preferences.getInt("LAST_MODIFIED_TIME");
    print("loading starts");
    if(lastModifiedTime == null) {
      await load();
      await setLastModifiedTime();
      return _checkForLoadingStatus();
    } else {
      DateTime lastModifiedDateTime = DateTime.fromMicrosecondsSinceEpoch(lastModifiedTime);
      int differenceInHours = DateTime.now().difference(lastModifiedDateTime).inHours;

      if(differenceInHours >= 24) {
        await load();
        await setLastModifiedTime();
        return _checkForLoadingStatus();
      }
      print("loading complete");
      await Future.delayed(const Duration(seconds: 1));
      return true;
    }
  }

  Future<void> load() async {
    Box<DataSyncModel> dataSyncModelBox =
    databaseService.getStore<DataSyncModel>(describeEnum(DbModel.DataSyncModel));

    await dataSyncModelBox.clear();
    print("datasyncbox cleared");

    await BooksLoader().getDataFromDB();

    Box<BooksModel> booksModelBox =
    databaseService.getStore<BooksModel>(describeEnum(DbModel.BooksModel));

    List<BooksModel> booksModelList = booksModelBox.values.toList();

    if(booksModelList.isNotEmpty) {
      Box<ChapterSummaryModel> chapterSummaryModel =
      databaseService.getStore<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));
      await chapterSummaryModel.clear();
      print("chapter summary model cleared");

      Box<ChapterDetailedModel> chapterDetailedModel =
      databaseService.getStore<ChapterDetailedModel>(describeEnum(DbModel.ChapterDetailedModel));
      await chapterDetailedModel.clear();
      print("chapter detailed model cleared");
    }

    for(BooksModel booksModel in booksModelList) {
      await ChapterSummaryLoader().getDataFromDB(booksModel);
      await ChapterDetailedLoader().getDataFromDB(booksModel);
    }


  }

  Future<void> setLastModifiedTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int currentDateTime = DateTime.now().microsecondsSinceEpoch;
    preferences.setInt("LAST_MODIFIED_TIME", currentDateTime);
  }

  bool _checkForLoadingStatus() {
    Box<BooksModel> booksModelBox =
    databaseService.getStore<BooksModel>(describeEnum(DbModel.BooksModel));

    int flag = booksModelBox.values.toList().length * 2;

    Box<DataSyncModel> dataSyncModelBox =
        databaseService.getStore<DataSyncModel>(describeEnum(DbModel.DataSyncModel));

    List<DataSyncModel> dataSyncList = dataSyncModelBox.values.where(
            (element) =>
            element.successStatus == true).toList();

    print("flag value: $flag -- datasynclist: ${dataSyncList.length}");

    return dataSyncList.length == flag ? true : false;
  }
}