// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_sync_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataSyncModelAdapter extends TypeAdapter<DataSyncModel> {
  @override
  final int typeId = 0;

  @override
  DataSyncModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataSyncModel(
      id: fields[0] as int,
      name: fields[1] as String,
      successStatus: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DataSyncModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.successStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataSyncModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
