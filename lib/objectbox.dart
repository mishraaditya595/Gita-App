import 'models/change_data_model.dart';
import 'objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;
  late final Box<ChangeDataModel> changeDataBox;

  ObjectBox._create(this.store) {
    changeDataBox = Box<ChangeDataModel>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}