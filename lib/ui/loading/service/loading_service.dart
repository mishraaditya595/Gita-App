import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sbg/models/data_sync_model.dart';

import '../../../network/chapter_detailed_loader.dart';
import '../../../network/chapter_summary_loader.dart';
import '../../../objectbox.g.dart';
import '../../../services/db/database_service.dart';

@Singleton()
class LoadingService {
  DatabaseService databaseService;

  LoadingService(this.databaseService);

  Future<bool> fetchAllLoaders() async {
    Store store = databaseService.getStore()!;
    store.box<DataSyncModel>().removeAll();
    await ChapterSummaryLoader().getDataFromDB();
    await ChapterDetailedLoader().getDataFromDB();

    return _checkForLoadingStatus() ;
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