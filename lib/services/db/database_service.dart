import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/models/data_sync_model.dart';
import 'package:sbg/models/last_read_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';


@Singleton()
class DatabaseService<T> {

  DatabaseService();

  Box<T> getStore<T>([String boxName = ""]) {
    return Hive.box<T>(boxName);
  }

  Future<void> init([String env = "prod"]) async {
    if (env == "test") {

    } else {
      await Hive.initFlutter();
      try {
        Hive.registerAdapter(ChapterDetailedModelAdapter());
        Hive.registerAdapter(ChapterSummaryModelAdapter());
        Hive.registerAdapter(DataSyncModelAdapter());
        Hive.registerAdapter(LastReadModelAdapter());
        Hive.registerAdapter(VerseBookmarkModelAdapter());
      } on HiveError catch(e) {
        debugPrint("$e");
      }

      await Hive.openBox<ChapterDetailedModel>(describeEnum(DbModel.ChapterDetailedModel));
      await Hive.openBox<ChapterSummaryModel>(describeEnum(DbModel.ChapterSummaryModel));
      await Hive.openBox<DataSyncModel>(describeEnum(DbModel.DataSyncModel));
      await Hive.openBox<LastReadModel>(describeEnum(DbModel.LastReadModel));
      await Hive.openBox<VerseBookmarkModel>(describeEnum(DbModel.VerseBookmarkModel));
    }
  }
}

enum DbModel {
  ChapterDetailedModel,
  ChapterSummaryModel,
  DataSyncModel,
  LastReadModel,
  VerseBookmarkModel
}
