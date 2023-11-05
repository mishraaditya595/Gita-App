// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_read_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LastReadModelAdapter extends TypeAdapter<LastReadModel> {
  @override
  final int typeId = 3;

  @override
  LastReadModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LastReadModel(
      id: fields[0] as int,
      lastReadVerseText: fields[1] as String,
      lastReadVerseNum: fields[2] as String,
      verseNumber: fields[3] as int,
      chapterNumber: fields[4] as int,
      bookHashName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LastReadModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.lastReadVerseText)
      ..writeByte(2)
      ..write(obj.lastReadVerseNum)
      ..writeByte(3)
      ..write(obj.verseNumber)
      ..writeByte(4)
      ..write(obj.chapterNumber)
      ..writeByte(5)
      ..write(obj.bookHashName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LastReadModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
