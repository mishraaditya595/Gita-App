import 'package:objectbox/objectbox.dart';

@Entity()
class ChapterSummaryModel {
  @Id()
  int id;
  String chapterNumber;
  String name;
  String nameTranslated;
  int verseCount;
  String nameMeaning;
  String summary;
  String summaryHindi;

  ChapterSummaryModel( {
    this.id = 0,
    required this.chapterNumber,
    required this.name,
    required this.nameTranslated,
    required this.verseCount,
    required this.nameMeaning,
    required this.summary,
    required this.summaryHindi
  });
}