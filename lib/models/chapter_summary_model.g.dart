// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_summary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterSummaryModelAdapter extends TypeAdapter<ChapterSummaryModel> {
  @override
  final int typeId = 2;

  @override
  ChapterSummaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterSummaryModel(
      id: fields[0] as int,
      chapterNumber: fields[1] as String,
      chapterNumberInt: fields[2] as int,
      name: fields[3] as String,
      nameTranslated: fields[4] as String,
      verseCount: fields[5] as int,
      nameMeaning: fields[6] as String,
      summary: fields[7] as String,
      summaryHindi: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterSummaryModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chapterNumber)
      ..writeByte(2)
      ..write(obj.chapterNumberInt)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.nameTranslated)
      ..writeByte(5)
      ..write(obj.verseCount)
      ..writeByte(6)
      ..write(obj.nameMeaning)
      ..writeByte(7)
      ..write(obj.summary)
      ..writeByte(8)
      ..write(obj.summaryHindi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterSummaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
