import 'package:isar/isar.dart' as isar;
import 'package:isar/isar.dart';

class ChapterDetailedModel {
  String? verseNumber;
  String? chapterNumber;
  String? text;
  String? transliteration;
  String? wordMeanings;
  String? translation;
  String? commentary;
  int? verseNumberInt;

  ChapterDetailedModel({
    this.verseNumber,
    this.chapterNumber,
    this.text,
    this.transliteration,
    this.wordMeanings,
    this.translation,
    this.commentary,
    this.verseNumberInt,
  });
}
