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
import 'models/last_read_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4605464640859024041),
      name: 'ChangeDataModel',
      lastPropertyId: const IdUid(3, 611808996349731946),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 631598253746678777),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2648657845332808553),
            name: 'time',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 611808996349731946),
            name: 'newChanges',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 2350201788602494012),
      name: 'ChapterSummaryModel',
      lastPropertyId: const IdUid(8, 6103684077434242666),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 182760544844671507),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1802463272824079836),
            name: 'chapterNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7871431140520090221),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6722033517699587566),
            name: 'nameTranslated',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2985087891785445337),
            name: 'verseCount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4467316685528866174),
            name: 'nameMeaning',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 4041535331279969723),
            name: 'summary',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 6103684077434242666),
            name: 'summaryHindi',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 7618862879632358247),
      name: 'ChapterDetailedModel',
      lastPropertyId: const IdUid(9, 3481225164697122688),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7814200177994787930),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 507314777544254679),
            name: 'verseNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 253621234745480539),
            name: 'chapterNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2846043642733761091),
            name: 'text',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8540478124424824320),
            name: 'transliteration',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7803530936679913570),
            name: 'wordMeanings',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1843835183797925484),
            name: 'translation',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 2489769599131382820),
            name: 'commentary',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 3481225164697122688),
            name: 'verseNumberInt',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 2916574112982275347),
      name: 'LastReadModel',
      lastPropertyId: const IdUid(3, 3489676501494633631),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3544216668367809788),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3237198461996679234),
            name: 'lastReadVerseText',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3489676501494633631),
            name: 'lastReadVerseNum',
            type: 9,
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
      lastEntityId: const IdUid(4, 2916574112982275347),
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
    ChapterSummaryModel: EntityDefinition<ChapterSummaryModel>(
        model: _entities[1],
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
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, chapterNumberOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, nameTranslatedOffset);
          fbb.addInt64(4, object.verseCount);
          fbb.addOffset(5, nameMeaningOffset);
          fbb.addOffset(6, summaryOffset);
          fbb.addOffset(7, summaryHindiOffset);
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
    ChapterDetailedModel: EntityDefinition<ChapterDetailedModel>(
        model: _entities[2],
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
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, lastReadVerseTextOffset);
          fbb.addOffset(2, lastReadVerseNumOffset);
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
                  .vTableGet(buffer, rootOffset, 8, ''));

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

/// [ChapterSummaryModel] entity fields to define ObjectBox queries.
class ChapterSummaryModel_ {
  /// see [ChapterSummaryModel.id]
  static final id =
      QueryIntegerProperty<ChapterSummaryModel>(_entities[1].properties[0]);

  /// see [ChapterSummaryModel.chapterNumber]
  static final chapterNumber =
      QueryStringProperty<ChapterSummaryModel>(_entities[1].properties[1]);

  /// see [ChapterSummaryModel.name]
  static final name =
      QueryStringProperty<ChapterSummaryModel>(_entities[1].properties[2]);

  /// see [ChapterSummaryModel.nameTranslated]
  static final nameTranslated =
      QueryStringProperty<ChapterSummaryModel>(_entities[1].properties[3]);

  /// see [ChapterSummaryModel.verseCount]
  static final verseCount =
      QueryIntegerProperty<ChapterSummaryModel>(_entities[1].properties[4]);

  /// see [ChapterSummaryModel.nameMeaning]
  static final nameMeaning =
      QueryStringProperty<ChapterSummaryModel>(_entities[1].properties[5]);

  /// see [ChapterSummaryModel.summary]
  static final summary =
      QueryStringProperty<ChapterSummaryModel>(_entities[1].properties[6]);

  /// see [ChapterSummaryModel.summaryHindi]
  static final summaryHindi =
      QueryStringProperty<ChapterSummaryModel>(_entities[1].properties[7]);
}

/// [ChapterDetailedModel] entity fields to define ObjectBox queries.
class ChapterDetailedModel_ {
  /// see [ChapterDetailedModel.id]
  static final id =
      QueryIntegerProperty<ChapterDetailedModel>(_entities[2].properties[0]);

  /// see [ChapterDetailedModel.verseNumber]
  static final verseNumber =
      QueryStringProperty<ChapterDetailedModel>(_entities[2].properties[1]);

  /// see [ChapterDetailedModel.chapterNumber]
  static final chapterNumber =
      QueryStringProperty<ChapterDetailedModel>(_entities[2].properties[2]);

  /// see [ChapterDetailedModel.text]
  static final text =
      QueryStringProperty<ChapterDetailedModel>(_entities[2].properties[3]);

  /// see [ChapterDetailedModel.transliteration]
  static final transliteration =
      QueryStringProperty<ChapterDetailedModel>(_entities[2].properties[4]);

  /// see [ChapterDetailedModel.wordMeanings]
  static final wordMeanings =
      QueryStringProperty<ChapterDetailedModel>(_entities[2].properties[5]);

  /// see [ChapterDetailedModel.translation]
  static final translation =
      QueryStringProperty<ChapterDetailedModel>(_entities[2].properties[6]);

  /// see [ChapterDetailedModel.commentary]
  static final commentary =
      QueryStringProperty<ChapterDetailedModel>(_entities[2].properties[7]);

  /// see [ChapterDetailedModel.verseNumberInt]
  static final verseNumberInt =
      QueryIntegerProperty<ChapterDetailedModel>(_entities[2].properties[8]);
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
}
