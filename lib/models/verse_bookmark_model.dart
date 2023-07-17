
import 'package:isar/isar.dart';

part 'verse_bookmark_model.g.dart';

@collection
class VerseBookmarkModel {
  Id id = Isar.autoIncrement;
  String verseNumber;
  String chapterNumber;
  String text;
  String transliteration;
  String wordMeanings;
  String translation;
  String commentary;
  int verseNumberInt;
  int creationTime;

  VerseBookmarkModel({
    this.id = 0,
    required this.verseNumber,
    required this.chapterNumber,
    required this.text,
    required this.transliteration,
    required this.wordMeanings,
    required this.translation,
    required this.commentary,
    required this.verseNumberInt,
    required this.creationTime,
  });
}
