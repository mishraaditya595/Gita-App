import 'package:hive/hive.dart';

part 'data_sync_model.g.dart';

@HiveType(typeId: 2)
class DataSyncModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  bool successStatus;

  DataSyncModel({
    this.id = 0,
    required this.name,
    required this.successStatus
  });
}