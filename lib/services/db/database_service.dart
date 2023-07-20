import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';


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
    }
  }
}
