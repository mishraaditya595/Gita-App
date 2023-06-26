import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sbg/models/data_sync_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../network/chapter_detailed_loader.dart';
import '../../../network/chapter_summary_loader.dart';
import '../../../objectbox.g.dart';
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
      return _checkForLoadingStatus();
    } else {
      DateTime lastModifiedDateTime = DateTime.fromMicrosecondsSinceEpoch(lastModifiedTime);
      int differenceInHours = DateTime.now().difference(lastModifiedDateTime).inHours;

      if(differenceInHours >= 24) {
        await load();
        await setLastModifiedTime();
        return _checkForLoadingStatus();
      }

      await Future.delayed(const Duration(seconds: 1));
      return true;
    }
  }

  Future<void> load() async {
    Store store = databaseService.getStore()!;
    store.box<DataSyncModel>().removeAll();
    await ChapterSummaryLoader().getDataFromDB();
    await ChapterDetailedLoader().getDataFromDB();
  }

  Future<void> setLastModifiedTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int currentDateTime = DateTime.now().microsecondsSinceEpoch;
    preferences.setInt("LAST_MODIFIED_TIME", currentDateTime);
  }

  bool _checkForLoadingStatus() {
    Store store = databaseService.getStore()!;
    Box<DataSyncModel> box =
    store.box<DataSyncModel>();
    QueryBuilder<DataSyncModel> queryBuilder = box
        .query(DataSyncModel_.successStatus.equals(true));
    Query<DataSyncModel> query = queryBuilder.build();
    List<DataSyncModel> dataSyncList = query.find();

    return dataSyncList.length == 2 ? true : false;
  }
}