// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/change_data_model.dart';
import 'models/chapter_detailed_model.dart';
import 'models/chapter_summary_model.dart';
import 'models/data_sync_model.dart';
import 'models/last_read_model.dart';
import 'models/verse_bookmark_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1198697470574800129),
      name: 'ChangeDataModel',
      lastPropertyId: const IdUid(3, 5317059640710298463),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7749246837034098723),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8553695706707437080),
            name: 'time',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5317059640710298463),
            name: 'newChanges',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 1262310592627167807),
      name: 'ChapterDetailedModel',
      lastPropertyId: const IdUid(9, 4736431515877668011),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2808923674302981353),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5220173913573483400),
            name: 'verseNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 9125874749833152397),
            name: 'chapterNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 727104373435629920),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7327900945731703093),
            name: 'transliteration',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7908339403025115415),
            name: 'wordMeanings',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3238204551168316783),
            name: 'translation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7095085479036570893),
            name: 'commentary',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4736431515877668011),
            name: 'verseNumberInt',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 530850479792594835),
      name: 'ChapterSummaryModel',
      lastPropertyId: const IdUid(9, 1634178494814739599),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6275383497214268899),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5487646581318158195),
            name: 'chapterNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5229881031506028443),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 9200329627649516901),
            name: 'nameTranslated',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 6371884711031105720),
            name: 'verseCount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4870179339442194854),
            name: 'nameMeaning',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1773580820758063811),
            name: 'summary',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7327506249018949374),
            name: 'summaryHindi',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 1634178494814739599),
            name: 'chapterNumberInt',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 6817779574871388624),
      name: 'LastReadModel',
      lastPropertyId: const IdUid(5, 5568076561294524678),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 521898702558106735),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3508816465459199348),
            name: 'lastReadVerseText',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7318519863334861339),
            name: 'lastReadVerseNum',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6317986182718779938),
            name: 'verseNumber',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5568076561294524678),
            name: 'chapterNumber',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 1303902611909325809),
      name: 'VerseBookmarkModel',
      lastPropertyId: const IdUid(10, 458364712437187152),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8097952472994113511),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1378279774817286318),
            name: 'verseNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5640136846374136135),
            name: 'chapterNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3649289683932357168),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5462916464571876843),
            name: 'transliteration',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4158791229612417217),
            name: 'wordMeanings',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1338885755647442367),
            name: 'translation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 551068684226943848),
            name: 'commentary',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 462972408194767474),
            name: 'verseNumberInt',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 458364712437187152),
            name: 'creationTime',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 1215970957034101490),
      name: 'DataSyncModel',
      lastPropertyId: const IdUid(3, 660627589827206888),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7266836067806787302),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8071888316437942144),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 660627589827206888),
            name: 'successStatus',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(6, 1215970957034101490),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ChangeDataModel: EntityDefinition<ChangeDataModel>(
        model: _entities[0],
        toOneRelations: (ChangeDataModel object) => [],
        toManyRelations: (ChangeDataModel object) => {},
        getId: (ChangeDataModel object) => object.id,
        setId: (ChangeDataModel object, int id) {
          object.id = id;
        },
        objectToFB: (ChangeDataModel object, fb.Builder fbb) {
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.time);
          fbb.addBool(2, object.newChanges);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChangeDataModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              time: const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              newChanges: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 8, false));

          return object;
        }),
    ChapterDetailedModel: EntityDefinition<ChapterDetailedModel>(
        model: _entities[1],
        toOneRelations: (ChapterDetailedModel object) => [],
        toManyRelations: (ChapterDetailedModel object) => {},
        getId: (ChapterDetailedModel object) => object.id,
        setId: (ChapterDetailedModel object, int id) {
          object.id = id;
        },
        objectToFB: (ChapterDetailedModel object, fb.Builder fbb) {
          final verseNumberOffset = fbb.writeString(object.verseNumber);
          final chapterNumberOffset = fbb.writeString(object.chapterNumber);
          final textOffset = fbb.writeString(object.text);
          final transliterationOffset = fbb.writeString(object.transliteration);
          final wordMeaningsOffset = fbb.writeString(object.wordMeanings);
          final translationOffset = fbb.writeString(object.translation);
          final commentaryOffset = fbb.writeString(object.commentary);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, verseNumberOffset);
          fbb.addOffset(2, chapterNumberOffset);
          fbb.addOffset(3, textOffset);
          fbb.addOffset(4, transliterationOffset);
          fbb.addOffset(5, wordMeaningsOffset);
          fbb.addOffset(6, translationOffset);
          fbb.addOffset(7, commentaryOffset);
          fbb.addInt64(8, object.verseNumberInt);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChapterDetailedModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              verseNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              chapterNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              text: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              transliteration: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              wordMeanings: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              translation: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              commentary: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              verseNumberInt:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0));

          return object;
        }),
    ChapterSummaryModel: EntityDefinition<ChapterSummaryModel>(
        model: _entities[2],
        toOneRelations: (ChapterSummaryModel object) => [],
        toManyRelations: (ChapterSummaryModel object) => {},
        getId: (ChapterSummaryModel object) => object.id,
        setId: (ChapterSummaryModel object, int id) {
          object.id = id;
        },
        objectToFB: (ChapterSummaryModel object, fb.Builder fbb) {
          final chapterNumberOffset = fbb.writeString(object.chapterNumber);
          final nameOffset = fbb.writeString(object.name);
          final nameTranslatedOffset = fbb.writeString(object.nameTranslated);
          final nameMeaningOffset = fbb.writeString(object.nameMeaning);
          final summaryOffset = fbb.writeString(object.summary);
          final summaryHindiOffset = fbb.writeString(object.summaryHindi);
          fbb.startTable(10);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, chapterNumberOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, nameTranslatedOffset);
          fbb.addInt64(4, object.verseCount);
          fbb.addOffset(5, nameMeaningOffset);
          fbb.addOffset(6, summaryOffset);
          fbb.addOffset(7, summaryHindiOffset);
          fbb.addInt64(8, object.chapterNumberInt);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChapterSummaryModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              chapterNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              chapterNumberInt:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              nameTranslated: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              verseCount:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0),
              nameMeaning: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              summary: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              summaryHindi: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''));

          return object;
        }),
    LastReadModel: EntityDefinition<LastReadModel>(
        model: _entities[3],
        toOneRelations: (LastReadModel object) => [],
        toManyRelations: (LastReadModel object) => {},
        getId: (LastReadModel object) => object.id,
        setId: (LastReadModel object, int id) {
          object.id = id;
        },
        objectToFB: (LastReadModel object, fb.Builder fbb) {
          final lastReadVerseTextOffset =
              fbb.writeString(object.lastReadVerseText);
          final lastReadVerseNumOffset =
              fbb.writeString(object.lastReadVerseNum);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, lastReadVerseTextOffset);
          fbb.addOffset(2, lastReadVerseNumOffset);
          fbb.addInt64(3, object.verseNumber);
          fbb.addInt64(4, object.chapterNumber);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LastReadModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              lastReadVerseText: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              lastReadVerseNum: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              verseNumber:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0),
              chapterNumber:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));

          return object;
        }),
    VerseBookmarkModel: EntityDefinition<VerseBookmarkModel>(
        model: _entities[4],
        toOneRelations: (VerseBookmarkModel object) => [],
        toManyRelations: (VerseBookmarkModel object) => {},
        getId: (VerseBookmarkModel object) => object.id,
        setId: (VerseBookmarkModel object, int id) {
          object.id = id;
        },
        objectToFB: (VerseBookmarkModel object, fb.Builder fbb) {
          final verseNumberOffset = fbb.writeString(object.verseNumber);
          final chapterNumberOffset = fbb.writeString(object.chapterNumber);
          final textOffset = fbb.writeString(object.text);
          final transliterationOffset = fbb.writeString(object.transliteration);
          final wordMeaningsOffset = fbb.writeString(object.wordMeanings);
          final translationOffset = fbb.writeString(object.translation);
          final commentaryOffset = fbb.writeString(object.commentary);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, verseNumberOffset);
          fbb.addOffset(2, chapterNumberOffset);
          fbb.addOffset(3, textOffset);
          fbb.addOffset(4, transliterationOffset);
          fbb.addOffset(5, wordMeaningsOffset);
          fbb.addOffset(6, translationOffset);
          fbb.addOffset(7, commentaryOffset);
          fbb.addInt64(8, object.verseNumberInt);
          fbb.addInt64(9, object.creationTime);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = VerseBookmarkModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              verseNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              chapterNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              text: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              transliteration: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              wordMeanings: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              translation: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              commentary: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              verseNumberInt:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0),
              creationTime: const fb.Int64Reader().vTableGet(buffer, rootOffset, 22, 0));

          return object;
        }),
    DataSyncModel: EntityDefinition<DataSyncModel>(
        model: _entities[5],
        toOneRelations: (DataSyncModel object) => [],
        toManyRelations: (DataSyncModel object) => {},
        getId: (DataSyncModel object) => object.id,
        setId: (DataSyncModel object, int id) {
          object.id = id;
        },
        objectToFB: (DataSyncModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addBool(2, object.successStatus);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DataSyncModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              successStatus: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 8, false));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ChangeDataModel] entity fields to define ObjectBox queries.
class ChangeDataModel_ {
  /// see [ChangeDataModel.id]
  static final id =
      QueryIntegerProperty<ChangeDataModel>(_entities[0].properties[0]);

  /// see [ChangeDataModel.time]
  static final time =
      QueryIntegerProperty<ChangeDataModel>(_entities[0].properties[1]);

  /// see [ChangeDataModel.newChanges]
  static final newChanges =
      QueryBooleanProperty<ChangeDataModel>(_entities[0].properties[2]);
}

/// [ChapterDetailedModel] entity fields to define ObjectBox queries.
class ChapterDetailedModel_ {
  /// see [ChapterDetailedModel.id]
  static final id =
      QueryIntegerProperty<ChapterDetailedModel>(_entities[1].properties[0]);

  /// see [ChapterDetailedModel.verseNumber]
  static final verseNumber =
      QueryStringProperty<ChapterDetailedModel>(_entities[1].properties[1]);

  /// see [ChapterDetailedModel.chapterNumber]
  static final chapterNumber =
      QueryStringProperty<ChapterDetailedModel>(_entities[1].properties[2]);

  /// see [ChapterDetailedModel.text]
  static final text =
      QueryStringProperty<ChapterDetailedModel>(_entities[1].properties[3]);

  /// see [ChapterDetailedModel.transliteration]
  static final transliteration =
      QueryStringProperty<ChapterDetailedModel>(_entities[1].properties[4]);

  /// see [ChapterDetailedModel.wordMeanings]
  static final wordMeanings =
      QueryStringProperty<ChapterDetailedModel>(_entities[1].properties[5]);

  /// see [ChapterDetailedModel.translation]
  static final translation =
      QueryStringProperty<ChapterDetailedModel>(_entities[1].properties[6]);

  /// see [ChapterDetailedModel.commentary]
  static final commentary =
      QueryStringProperty<ChapterDetailedModel>(_entities[1].properties[7]);

  /// see [ChapterDetailedModel.verseNumberInt]
  static final verseNumberInt =
      QueryIntegerProperty<ChapterDetailedModel>(_entities[1].properties[8]);
}

/// [ChapterSummaryModel] entity fields to define ObjectBox queries.
class ChapterSummaryModel_ {
  /// see [ChapterSummaryModel.id]
  static final id =
      QueryIntegerProperty<ChapterSummaryModel>(_entities[2].properties[0]);

  /// see [ChapterSummaryModel.chapterNumber]
  static final chapterNumber =
      QueryStringProperty<ChapterSummaryModel>(_entities[2].properties[1]);

  /// see [ChapterSummaryModel.name]
  static final name =
      QueryStringProperty<ChapterSummaryModel>(_entities[2].properties[2]);

  /// see [ChapterSummaryModel.nameTranslated]
  static final nameTranslated =
      QueryStringProperty<ChapterSummaryModel>(_entities[2].properties[3]);

  /// see [ChapterSummaryModel.verseCount]
  static final verseCount =
      QueryIntegerProperty<ChapterSummaryModel>(_entities[2].properties[4]);

  /// see [ChapterSummaryModel.nameMeaning]
  static final nameMeaning =
      QueryStringProperty<ChapterSummaryModel>(_entities[2].properties[5]);

  /// see [ChapterSummaryModel.summary]
  static final summary =
      QueryStringProperty<ChapterSummaryModel>(_entities[2].properties[6]);

  /// see [ChapterSummaryModel.summaryHindi]
  static final summaryHindi =
      QueryStringProperty<ChapterSummaryModel>(_entities[2].properties[7]);

  /// see [ChapterSummaryModel.chapterNumberInt]
  static final chapterNumberInt =
      QueryIntegerProperty<ChapterSummaryModel>(_entities[2].properties[8]);
}

/// [LastReadModel] entity fields to define ObjectBox queries.
class LastReadModel_ {
  /// see [LastReadModel.id]
  static final id =
      QueryIntegerProperty<LastReadModel>(_entities[3].properties[0]);

  /// see [LastReadModel.lastReadVerseText]
  static final lastReadVerseText =
      QueryStringProperty<LastReadModel>(_entities[3].properties[1]);

  /// see [LastReadModel.lastReadVerseNum]
  static final lastReadVerseNum =
      QueryStringProperty<LastReadModel>(_entities[3].properties[2]);

  /// see [LastReadModel.verseNumber]
  static final verseNumber =
      QueryIntegerProperty<LastReadModel>(_entities[3].properties[3]);

  /// see [LastReadModel.chapterNumber]
  static final chapterNumber =
      QueryIntegerProperty<LastReadModel>(_entities[3].properties[4]);
}

/// [VerseBookmarkModel] entity fields to define ObjectBox queries.
class VerseBookmarkModel_ {
  /// see [VerseBookmarkModel.id]
  static final id =
      QueryIntegerProperty<VerseBookmarkModel>(_entities[4].properties[0]);

  /// see [VerseBookmarkModel.verseNumber]
  static final verseNumber =
      QueryStringProperty<VerseBookmarkModel>(_entities[4].properties[1]);

  /// see [VerseBookmarkModel.chapterNumber]
  static final chapterNumber =
      QueryStringProperty<VerseBookmarkModel>(_entities[4].properties[2]);

  /// see [VerseBookmarkModel.text]
  static final text =
      QueryStringProperty<VerseBookmarkModel>(_entities[4].properties[3]);

  /// see [VerseBookmarkModel.transliteration]
  static final transliteration =
      QueryStringProperty<VerseBookmarkModel>(_entities[4].properties[4]);

  /// see [VerseBookmarkModel.wordMeanings]
  static final wordMeanings =
      QueryStringProperty<VerseBookmarkModel>(_entities[4].properties[5]);

  /// see [VerseBookmarkModel.translation]
  static final translation =
      QueryStringProperty<VerseBookmarkModel>(_entities[4].properties[6]);

  /// see [VerseBookmarkModel.commentary]
  static final commentary =
      QueryStringProperty<VerseBookmarkModel>(_entities[4].properties[7]);

  /// see [VerseBookmarkModel.verseNumberInt]
  static final verseNumberInt =
      QueryIntegerProperty<VerseBookmarkModel>(_entities[4].properties[8]);

  /// see [VerseBookmarkModel.creationTime]
  static final creationTime =
      QueryIntegerProperty<VerseBookmarkModel>(_entities[4].properties[9]);
}

/// [DataSyncModel] entity fields to define ObjectBox queries.
class DataSyncModel_ {
  /// see [DataSyncModel.id]
  static final id =
      QueryIntegerProperty<DataSyncModel>(_entities[5].properties[0]);

  /// see [DataSyncModel.name]
  static final name =
      QueryStringProperty<DataSyncModel>(_entities[5].properties[1]);

  /// see [DataSyncModel.successStatus]
  static final successStatus =
      QueryBooleanProperty<DataSyncModel>(_entities[5].properties[2]);
}
