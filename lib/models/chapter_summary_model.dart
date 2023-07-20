
import 'package:hive/hive.dart';

part 'chapter_summary_model.g.dart';

@HiveType(typeId: 2)
class ChapterSummaryModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String chapterNumber;

  @HiveField(2)
  int chapterNumberInt;

  @HiveField(3)
  String name;

  @HiveField(4)
  String nameTranslated;

  @HiveField(5)
  int verseCount;

  @HiveField(6)
  String nameMeaning;

  @HiveField(7)
  String summary;

  @HiveField(8)
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
