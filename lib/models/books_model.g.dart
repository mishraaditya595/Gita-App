// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksModelAdapter extends TypeAdapter<BooksModel> {
  @override
  final int typeId = 5;

  @override
  BooksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksModel(
      id: fields[0] as int,
      bookName: fields[1] as String,
      bookImage: fields[2] as String,
      bookHashWord: fields[3] as String,
      chapterDetailedLink: fields[4] as String,
      chapterSummaryLink: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BooksModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bookName)
      ..writeByte(2)
      ..write(obj.bookImage)
      ..writeByte(3)
      ..write(obj.bookHashWord)
      ..writeByte(4)
      ..write(obj.chapterDetailedLink)
      ..writeByte(5)
      ..write(obj.chapterSummaryLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
