import 'package:hive/hive.dart';

part 'books_model.g.dart';

@HiveType(typeId: 5)
class BooksModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String bookName;

  @HiveField(2)
  String bookImage;

  @HiveField(3)
  String bookHashWord;

  @HiveField(4)
  String chapterDetailedLink;

  @HiveField(5)
  String chapterSummaryLink;

  BooksModel({
    required this.id,
    required this.bookName,
    required this.bookImage,
    required this.bookHashWord,
    required this.chapterDetailedLink,
    required this.chapterSummaryLink
  });
}