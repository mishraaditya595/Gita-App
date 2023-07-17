import 'package:isar/isar.dart';

part 'last_read_model.g.dart';

@collection
class LastReadModel {
  Id id = Isar.autoIncrement;
  String lastReadVerseText;
  String lastReadVerseNum;
  int verseNumber;
  int chapterNumber;

  LastReadModel({
    this.id = 0,
    required this.lastReadVerseText,
    required this.lastReadVerseNum,
    required this.verseNumber,
    required this.chapterNumber,
  });
}
