import 'package:hive/hive.dart';

part 'last_read_model.g.dart';

@HiveType(typeId: 3)
class LastReadModel extends HiveObject{
  @HiveField(0)
  int id;

  @HiveField(1)
  String lastReadVerseText;

  @HiveField(2)
  String lastReadVerseNum;

  @HiveField(3)
  int verseNumber;

  @HiveField(4)
  int chapterNumber;

  @HiveField(5)
  String bookHashName;

  LastReadModel({
    this.id = 0,
    required this.lastReadVerseText,
    required this.lastReadVerseNum,
    required this.verseNumber,
    required this.chapterNumber,
    required this.bookHashName
  });
}
