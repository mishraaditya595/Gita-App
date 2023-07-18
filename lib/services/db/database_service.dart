import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/models/data_sync_model.dart';
import 'package:sbg/models/last_read_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';

import 'dbstore.dart';

@Singleton()
class DatabaseService<T> {
  // late DBStore dbStore;
  Isar? _store = null;

  // Store? get store => _store;

  // DatabaseService(this.dbStore);

  Isar? getStore() {
    return _store;
  }

  Future<void> init([String env = "prod"]) async {
    // if (env == "test") {
    //   _store = await openStore(directory: '/tmp/test');
    // } else {
    //   try {
    //     _store = await dbStore.getStore();
    //   } catch (_) {
    //     _store = await openStore();
    //   }
    // }
    final dir = await getApplicationDocumentsDirectory();
    _store = await Isar.open(
      [
        ChapterDetailedModelSchema,
        ChapterSummaryModelSchema,
        DataSyncModelSchema,
        LastReadModelSchema,
        VerseBookmarkModelSchema
      ],
      directory: dir.path,
    );
  }
}
