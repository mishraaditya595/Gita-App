import 'dart:developer';

import 'package:sbg/models/chapter_summary_model.dart';

import 'models/change_data_model.dart';
import 'objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<ChangeDataModel> changeDataBox;
  late final Box<ChapterSummaryModel> chapterSummaryBox;

  ObjectBox();

  ObjectBox._create(this.store) {
    changeDataBox = Box<ChangeDataModel>(store);
    chapterSummaryBox = Box<ChapterSummaryModel>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  getStore() async {
    return await openStore();
  }
}
