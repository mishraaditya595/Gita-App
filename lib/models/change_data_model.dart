import 'package:objectbox/objectbox.dart';

@Entity()
class ChangeDataModel {
  @Id()
  int id;
  int time;
  bool newChanges;

  ChangeDataModel({
    required this.id,
    required this.time,
    required this.newChanges,
  });
}
