import 'package:hive/hive.dart';

part 'verse_bookmark_model.g.dart';

@HiveType(typeId: 4)
class VerseBookmarkModel extends HiveObject{
  @HiveField(0)
  int id;

  @HiveField(1)
  String verseNumber;

  @HiveField(2)
  String chapterNumber;

  @HiveField(3)
  String text;

  @HiveField(4)
  String transliteration;

  @HiveField(5)
  String wordMeanings;

  @HiveField(6)
  String translation;

  @HiveField(7)
  String commentary;

  @HiveField(8)
  int verseNumberInt;

  @HiveField(9)
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
