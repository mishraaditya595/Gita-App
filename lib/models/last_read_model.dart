import 'package:objectbox/objectbox.dart';

@Entity()
class LastReadModel {
  @Id()
  int id;
  String lastReadVerseText;
  String lastReadVerseNum;

  LastReadModel({
    this.id = 0,
    required this.lastReadVerseText,
    required this.lastReadVerseNum
  });
}