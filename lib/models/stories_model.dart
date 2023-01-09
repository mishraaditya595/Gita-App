import 'package:objectbox/objectbox.dart';

@Entity()
class StoriesModel {
  @Id()
  int id;
  String title;
  String pubDate;
  String link;
  String author;
  String thumbnail;
  String content;

  StoriesModel({
    this.id = 0,
    required this.title,
    required this.pubDate,
    required this.link,
    required this.author,
    required this.thumbnail,
    required this.content
  });
}