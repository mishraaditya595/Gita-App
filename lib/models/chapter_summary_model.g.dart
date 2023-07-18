// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_summary_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChapterSummaryModelCollection on Isar {
  IsarCollection<ChapterSummaryModel> get chapterSummaryModels =>
      this.collection();
}

final ChapterSummaryModelSchema = CollectionSchema(
  name: r'ChapterSummaryModel',
  id: BigInt.parse("-4973645032933431852").toInt(),
  properties: {
    r'chapterNumber': PropertySchema(
      id: BigInt.parse("0").toInt(),
      name: r'chapterNumber',
      type: IsarType.string,
    ),
    r'chapterNumberInt': PropertySchema(
      id: BigInt.parse("1").toInt(),
      name: r'chapterNumberInt',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: BigInt.parse("2").toInt(),
      name: r'name',
      type: IsarType.string,
    ),
    r'nameMeaning': PropertySchema(
      id: BigInt.parse("3").toInt(),
      name: r'nameMeaning',
      type: IsarType.string,
    ),
    r'nameTranslated': PropertySchema(
      id: BigInt.parse("4").toInt(),
      name: r'nameTranslated',
      type: IsarType.string,
    ),
    r'summary': PropertySchema(
      id: BigInt.parse("5").toInt(),
      name: r'summary',
      type: IsarType.string,
    ),
    r'summaryHindi': PropertySchema(
      id: BigInt.parse("6").toInt(),
      name: r'summaryHindi',
      type: IsarType.string,
    ),
    r'verseCount': PropertySchema(
      id: BigInt.parse("7").toInt(),
      name: r'verseCount',
      type: IsarType.long,
    )
  },
  estimateSize: _chapterSummaryModelEstimateSize,
  serialize: _chapterSummaryModelSerialize,
  deserialize: _chapterSummaryModelDeserialize,
  deserializeProp: _chapterSummaryModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chapterSummaryModelGetId,
  getLinks: _chapterSummaryModelGetLinks,
  attach: _chapterSummaryModelAttach,
  version: '3.1.0',
);

int _chapterSummaryModelEstimateSize(
  ChapterSummaryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.chapterNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nameMeaning;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nameTranslated;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.summary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.summaryHindi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _chapterSummaryModelSerialize(
  ChapterSummaryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chapterNumber);
  writer.writeLong(offsets[1], object.chapterNumberInt);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.nameMeaning);
  writer.writeString(offsets[4], object.nameTranslated);
  writer.writeString(offsets[5], object.summary);
  writer.writeString(offsets[6], object.summaryHindi);
  writer.writeLong(offsets[7], object.verseCount);
}

ChapterSummaryModel _chapterSummaryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterSummaryModel();
  object.chapterNumber = reader.readStringOrNull(offsets[0]);
  object.chapterNumberInt = reader.readLongOrNull(offsets[1]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[2]);
  object.nameMeaning = reader.readStringOrNull(offsets[3]);
  object.nameTranslated = reader.readStringOrNull(offsets[4]);
  object.summary = reader.readStringOrNull(offsets[5]);
  object.summaryHindi = reader.readStringOrNull(offsets[6]);
  object.verseCount = reader.readLongOrNull(offsets[7]);
  return object;
}

P _chapterSummaryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chapterSummaryModelGetId(ChapterSummaryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chapterSummaryModelGetLinks(
    ChapterSummaryModel object) {
  return [];
}

void _chapterSummaryModelAttach(
    IsarCollection<dynamic> col, Id id, ChapterSummaryModel object) {
  object.id = id;
}

extension ChapterSummaryModelQueryWhereSort
    on QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QWhere> {
  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChapterSummaryModelQueryWhere
    on QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QWhereClause> {
  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChapterSummaryModelQueryFilter on QueryBuilder<ChapterSummaryModel,
    ChapterSummaryModel, QFilterCondition> {
  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chapterNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chapterNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chapterNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIntIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chapterNumberInt',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIntIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chapterNumberInt',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIntEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterNumberInt',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIntGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chapterNumberInt',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIntLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chapterNumberInt',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      chapterNumberIntBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chapterNumberInt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameMeaning',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameMeaning',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameMeaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameMeaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameMeaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameMeaning',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameMeaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameMeaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameMeaning',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameMeaning',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameMeaning',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameMeaningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameMeaning',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nameTranslated',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nameTranslated',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameTranslated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameTranslated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameTranslated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameTranslated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameTranslated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameTranslated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameTranslated',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameTranslated',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameTranslated',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      nameTranslatedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameTranslated',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'summaryHindi',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'summaryHindi',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryHindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summaryHindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summaryHindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summaryHindi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summaryHindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summaryHindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summaryHindi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summaryHindi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryHindi',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      summaryHindiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summaryHindi',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      verseCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verseCount',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      verseCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verseCount',
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      verseCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verseCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      verseCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verseCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      verseCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verseCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterFilterCondition>
      verseCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verseCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChapterSummaryModelQueryObject on QueryBuilder<ChapterSummaryModel,
    ChapterSummaryModel, QFilterCondition> {}

extension ChapterSummaryModelQueryLinks on QueryBuilder<ChapterSummaryModel,
    ChapterSummaryModel, QFilterCondition> {}

extension ChapterSummaryModelQuerySortBy
    on QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QSortBy> {
  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByChapterNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumberInt', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByChapterNumberIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumberInt', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByNameMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameMeaning', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByNameMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameMeaning', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByNameTranslated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByNameTranslatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortBySummaryHindi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryHindi', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortBySummaryHindiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryHindi', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByVerseCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseCount', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      sortByVerseCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseCount', Sort.desc);
    });
  }
}

extension ChapterSummaryModelQuerySortThenBy
    on QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QSortThenBy> {
  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByChapterNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumberInt', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByChapterNumberIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumberInt', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByNameMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameMeaning', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByNameMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameMeaning', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByNameTranslated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByNameTranslatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameTranslated', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenBySummary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenBySummaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summary', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenBySummaryHindi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryHindi', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenBySummaryHindiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryHindi', Sort.desc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByVerseCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseCount', Sort.asc);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QAfterSortBy>
      thenByVerseCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseCount', Sort.desc);
    });
  }
}

extension ChapterSummaryModelQueryWhereDistinct
    on QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct> {
  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctByChapterNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctByChapterNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterNumberInt');
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctByNameMeaning({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameMeaning', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctByNameTranslated({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameTranslated',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctBySummary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctBySummaryHindi({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summaryHindi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QDistinct>
      distinctByVerseCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verseCount');
    });
  }
}

extension ChapterSummaryModelQueryProperty
    on QueryBuilder<ChapterSummaryModel, ChapterSummaryModel, QQueryProperty> {
  QueryBuilder<ChapterSummaryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChapterSummaryModel, String?, QQueryOperations>
      chapterNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterNumber');
    });
  }

  QueryBuilder<ChapterSummaryModel, int?, QQueryOperations>
      chapterNumberIntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterNumberInt');
    });
  }

  QueryBuilder<ChapterSummaryModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ChapterSummaryModel, String?, QQueryOperations>
      nameMeaningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameMeaning');
    });
  }

  QueryBuilder<ChapterSummaryModel, String?, QQueryOperations>
      nameTranslatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameTranslated');
    });
  }

  QueryBuilder<ChapterSummaryModel, String?, QQueryOperations>
      summaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summary');
    });
  }

  QueryBuilder<ChapterSummaryModel, String?, QQueryOperations>
      summaryHindiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summaryHindi');
    });
  }

  QueryBuilder<ChapterSummaryModel, int?, QQueryOperations>
      verseCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verseCount');
    });
  }
}
