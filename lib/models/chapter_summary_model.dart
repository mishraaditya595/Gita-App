import 'package:isar/isar.dart';

part 'chapter_summary_model.g.dart';

@collection
class ChapterSummaryModel {
  Id id = Isar.autoIncrement;
  String? chapterNumber;
  int? chapterNumberInt;
  String? name;
  String? nameTranslated;
  int? verseCount;
  String? nameMeaning;
  String? summary;
  String? summaryHindi;

}
