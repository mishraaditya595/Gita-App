import 'package:isar/isar.dart';

part 'chapter_summary_model.g.dart';

@collection
class ChapterSummaryModel {
  Id id = Isar.autoIncrement;
  String chapterNumber;
  int chapterNumberInt;
  String name;
  String nameTranslated;
  int verseCount;
  String nameMeaning;
  String summary;
  String summaryHindi;

  ChapterSummaryModel(
      {this.id = 0,
      required this.chapterNumber,
      required this.chapterNumberInt,
      required this.name,
      required this.nameTranslated,
      required this.verseCount,
      required this.nameMeaning,
      required this.summary,
      required this.summaryHindi});
}
