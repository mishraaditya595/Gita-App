import 'package:injectable/injectable.dart';

import '../../objectbox.g.dart';
import 'dbstore.dart';

@Singleton()
class DatabaseService<T> {
  late DBStore dbStore;
  Store? _store = null;

  // Store? get store => _store;

  DatabaseService(this.dbStore);

  Store? getStore() {
    return _store;
  }

  Future<void> init([String env = "prod"]) async {
    if (env == "test") {
      _store = await openStore(directory: '/tmp/test');
    } else {
      try {
        _store = await dbStore.getStore();
      } catch (_) {
        _store = await openStore();
      }
    }
  }
}
