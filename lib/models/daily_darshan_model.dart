import 'package:objectbox/objectbox.dart';


@Entity()
class DailyDarshanModel {
  @Id()
  int id;
  String files;
  List<String> filesList;
  int timestamp;

  DailyDarshanModel({
    this.id = 0,
    required this.files,
    required this.filesList,
    required this.timestamp,
  });
}