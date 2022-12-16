import 'package:objectbox/objectbox.dart';

@Entity()
class ChapterDetailedModel {
  @Id()
  int id;
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