import 'package:objectbox/objectbox.dart';

@Entity()
class NotificationsModel {
  @Id()
  int id;
  String title;
  String description;
  String imagePath;
  int dateTime;

  NotificationsModel({
    this.id = 0,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.imagePath
  });
}