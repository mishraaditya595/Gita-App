import 'package:isar/isar.dart' as isar;
import 'package:isar/isar.dart';

part 'chapter_detailed_model.g.dart';


@isar.collection
class ChapterDetailedModel {
  isar.Id id = isar.Isar.autoIncrement; // you can also use id = null to auto increment
  String? verseNumber;
  String? chapterNumber;
  String? text;
  String? transliteration;
  String? wordMeanings;
  String? translation;
  String? commentary;
  int? verseNumberInt;

  ChapterDetailedModel(
      [this.verseNumber,
      this.chapterNumber,
      this.text,
      this.transliteration,
      this.wordMeanings,
      this.translation,
      this.commentary,
      this.verseNumberInt]);
}
