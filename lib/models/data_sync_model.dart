import 'package:objectbox/objectbox.dart';

@Entity()
class DataSyncModel {
  @Id()
  int id;
  String name;
  bool successStatus;

  DataSyncModel({
    this.id = 0,
    required this.name,
    required this.successStatus
  });
}