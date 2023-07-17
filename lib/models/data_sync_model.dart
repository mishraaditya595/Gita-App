import 'package:isar/isar.dart';

part 'data_sync_model.g.dart';

@collection
class DataSyncModel {
  Id id = Isar.autoIncrement;
  String? name;
  bool? successStatus;

  // DataSyncModel({
  //   this.id = 0,
  //   required this.name,
  //   required this.successStatus
  // });
}