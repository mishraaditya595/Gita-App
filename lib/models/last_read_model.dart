import 'package:isar/isar.dart';

part 'last_read_model.g.dart';

@collection
class LastReadModel {
  Id id = Isar.autoIncrement;
  String? lastReadVerseText;
  String? lastReadVerseNum;
  int? verseNumber;
  int? chapterNumber;


}
