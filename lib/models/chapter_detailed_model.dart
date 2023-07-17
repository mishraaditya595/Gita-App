import 'package:isar/isar.dart' as isar;
import 'package:isar/isar.dart';

part 'chapter_detailed_model.g.dart';


@isar.collection
class ChapterDetailedModel {
  isar.Id id = isar.Isar.autoIncrement; // you can also use id = null to auto increment
  String verseNumber;
  String chapterNumber;
  String text;
  String transliteration;
  String wordMeanings;
  String translation;
  String commentary;
  int verseNumberInt;

  ChapterDetailedModel({
    this.id = 0,
    required this.verseNumber,
    required this.chapterNumber,
    required this.text,
    required this.transliteration,
    required this.wordMeanings,
    required this.translation,
    required this.commentary,
    required this.verseNumberInt,
  });
}
