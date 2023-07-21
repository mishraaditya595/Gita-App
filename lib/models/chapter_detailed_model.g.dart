// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_detailed_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterDetailedModelAdapter extends TypeAdapter<ChapterDetailedModel> {
  @override
  final int typeId = 1;

  @override
  ChapterDetailedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterDetailedModel(
      id: fields[0] as int,
      verseNumber: fields[1] as String,
      chapterNumber: fields[2] as String,
      text: fields[3] as String,
      transliteration: fields[4] as String,
      wordMeanings: fields[5] as String,
      translation: fields[6] as String,
      commentary: fields[7] as String,
      verseNumberInt: fields[8] as int,
      bookHashName: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterDetailedModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.verseNumber)
      ..writeByte(2)
      ..write(obj.chapterNumber)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.transliteration)
      ..writeByte(5)
      ..write(obj.wordMeanings)
      ..writeByte(6)
      ..write(obj.translation)
      ..writeByte(7)
      ..write(obj.commentary)
      ..writeByte(8)
      ..write(obj.verseNumberInt)
      ..writeByte(9)
      ..write(obj.bookHashName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterDetailedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
