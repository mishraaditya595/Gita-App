import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:sbg/models/data_sync_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    if(lastModifiedTime == null) {
      await load();
      await setLastModifiedTime();
      return await _checkForLoadingStatus();
    } else {
      DateTime lastModifiedDateTime = DateTime.fromMicrosecondsSinceEpoch(lastModifiedTime);
      int differenceInHours = DateTime.now().difference(lastModifiedDateTime).inHours;

      if(differenceInHours >= 24) {
        await load();
        await setLastModifiedTime();
        return await _checkForLoadingStatus();
      }

      await Future.delayed(const Duration(seconds: 1));
      return true;
    }
  }

  Future<void> load() async {
    Isar isar = databaseService.getStore()!;

    await isar.dataSyncModels.where().deleteAll();

    await ChapterSummaryLoader().getDataFromDB();
    await ChapterDetailedLoader().getDataFromDB();
  }

  Future<void> setLastModifiedTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int currentDateTime = DateTime.now().microsecondsSinceEpoch;
    preferences.setInt("LAST_MODIFIED_TIME", currentDateTime);
  }

  Future<bool> _checkForLoadingStatus() async {
    Isar isar = databaseService.getStore()!;

    List<DataSyncModel> dataSyncList = await isar.dataSyncModels.filter()
        .successStatusEqualTo(true).findAll();
    return dataSyncList.length == 2 ? true : false;
  }
}