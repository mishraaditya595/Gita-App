// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_detailed_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChapterDetailedModelCollection on Isar {
  IsarCollection<ChapterDetailedModel> get chapterDetailedModels =>
      this.collection();
}

const ChapterDetailedModelSchema = CollectionSchema(
  name: r'ChapterDetailedModel',
  id: -8535983497663087275,
  properties: {
    r'chapterNumber': PropertySchema(
      id: 0,
      name: r'chapterNumber',
      type: IsarType.string,
    ),
    r'commentary': PropertySchema(
      id: 1,
      name: r'commentary',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 2,
      name: r'text',
      type: IsarType.string,
    ),
    r'translation': PropertySchema(
      id: 3,
      name: r'translation',
      type: IsarType.string,
    ),
    r'transliteration': PropertySchema(
      id: 4,
      name: r'transliteration',
      type: IsarType.string,
    ),
    r'verseNumber': PropertySchema(
      id: 5,
      name: r'verseNumber',
      type: IsarType.string,
    ),
    r'verseNumberInt': PropertySchema(
      id: 6,
      name: r'verseNumberInt',
      type: IsarType.long,
    ),
    r'wordMeanings': PropertySchema(
      id: 7,
      name: r'wordMeanings',
      type: IsarType.string,
    )
  },
  estimateSize: _chapterDetailedModelEstimateSize,
  serialize: _chapterDetailedModelSerialize,
  deserialize: _chapterDetailedModelDeserialize,
  deserializeProp: _chapterDetailedModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chapterDetailedModelGetId,
  getLinks: _chapterDetailedModelGetLinks,
  attach: _chapterDetailedModelAttach,
  version: '3.1.0+1',
);

int _chapterDetailedModelEstimateSize(
  ChapterDetailedModel object,
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
    final value = object.commentary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.text;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.translation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transliteration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.verseNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.wordMeanings;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _chapterDetailedModelSerialize(
  ChapterDetailedModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chapterNumber);
  writer.writeString(offsets[1], object.commentary);
  writer.writeString(offsets[2], object.text);
  writer.writeString(offsets[3], object.translation);
  writer.writeString(offsets[4], object.transliteration);
  writer.writeString(offsets[5], object.verseNumber);
  writer.writeLong(offsets[6], object.verseNumberInt);
  writer.writeString(offsets[7], object.wordMeanings);
}

ChapterDetailedModel _chapterDetailedModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChapterDetailedModel(
    reader.readStringOrNull(offsets[5]),
    reader.readStringOrNull(offsets[0]),
    reader.readStringOrNull(offsets[2]),
    reader.readStringOrNull(offsets[4]),
    reader.readStringOrNull(offsets[7]),
    reader.readStringOrNull(offsets[3]),
    reader.readStringOrNull(offsets[1]),
    reader.readLongOrNull(offsets[6]),
  );
  object.id = id;
  return object;
}

P _chapterDetailedModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chapterDetailedModelGetId(ChapterDetailedModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chapterDetailedModelGetLinks(
    ChapterDetailedModel object) {
  return [];
}

void _chapterDetailedModelAttach(
    IsarCollection<dynamic> col, Id id, ChapterDetailedModel object) {
  object.id = id;
}

extension ChapterDetailedModelQueryWhereSort
    on QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QWhere> {
  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChapterDetailedModelQueryWhere
    on QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QWhereClause> {
  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterWhereClause>
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterWhereClause>
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

extension ChapterDetailedModelQueryFilter on QueryBuilder<ChapterDetailedModel,
    ChapterDetailedModel, QFilterCondition> {
  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberEqualTo(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberGreaterThan(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberLessThan(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberBetween(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberStartsWith(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberEndsWith(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      chapterNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      chapterNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chapterNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> chapterNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chapterNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commentary',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commentary',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'commentary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'commentary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'commentary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'commentary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'commentary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      commentaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commentary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      commentaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commentary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentary',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> commentaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commentary',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translation',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translation',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      translationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      translationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translation',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> translationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translation',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transliteration',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transliteration',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transliteration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transliteration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transliteration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transliteration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transliteration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transliteration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      transliterationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transliteration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      transliterationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transliteration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transliteration',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> transliterationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transliteration',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verseNumber',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verseNumber',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verseNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'verseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'verseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      verseNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'verseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      verseNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'verseNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'verseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIntIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verseNumberInt',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIntIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verseNumberInt',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIntEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verseNumberInt',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIntGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verseNumberInt',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIntLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verseNumberInt',
        value: value,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> verseNumberIntBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verseNumberInt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wordMeanings',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wordMeanings',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordMeanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordMeanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordMeanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordMeanings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wordMeanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wordMeanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      wordMeaningsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wordMeanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
          QAfterFilterCondition>
      wordMeaningsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wordMeanings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordMeanings',
        value: '',
      ));
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel,
      QAfterFilterCondition> wordMeaningsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wordMeanings',
        value: '',
      ));
    });
  }
}

extension ChapterDetailedModelQueryObject on QueryBuilder<ChapterDetailedModel,
    ChapterDetailedModel, QFilterCondition> {}

extension ChapterDetailedModelQueryLinks on QueryBuilder<ChapterDetailedModel,
    ChapterDetailedModel, QFilterCondition> {}

extension ChapterDetailedModelQuerySortBy
    on QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QSortBy> {
  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByCommentary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByCommentaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByTranslation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByTranslationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByTransliteration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByTransliterationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByVerseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByVerseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByVerseNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByVerseNumberIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByWordMeanings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      sortByWordMeaningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.desc);
    });
  }
}

extension ChapterDetailedModelQuerySortThenBy
    on QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QSortThenBy> {
  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByCommentary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByCommentaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByTranslation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByTranslationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByTransliteration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByTransliterationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByVerseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByVerseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByVerseNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByVerseNumberIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.desc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByWordMeanings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.asc);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QAfterSortBy>
      thenByWordMeaningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.desc);
    });
  }
}

extension ChapterDetailedModelQueryWhereDistinct
    on QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct> {
  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByChapterNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByCommentary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByTranslation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByTransliteration({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transliteration',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByVerseNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verseNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByVerseNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verseNumberInt');
    });
  }

  QueryBuilder<ChapterDetailedModel, ChapterDetailedModel, QDistinct>
      distinctByWordMeanings({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordMeanings', caseSensitive: caseSensitive);
    });
  }
}

extension ChapterDetailedModelQueryProperty on QueryBuilder<
    ChapterDetailedModel, ChapterDetailedModel, QQueryProperty> {
  QueryBuilder<ChapterDetailedModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChapterDetailedModel, String?, QQueryOperations>
      chapterNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterNumber');
    });
  }

  QueryBuilder<ChapterDetailedModel, String?, QQueryOperations>
      commentaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentary');
    });
  }

  QueryBuilder<ChapterDetailedModel, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<ChapterDetailedModel, String?, QQueryOperations>
      translationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translation');
    });
  }

  QueryBuilder<ChapterDetailedModel, String?, QQueryOperations>
      transliterationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transliteration');
    });
  }

  QueryBuilder<ChapterDetailedModel, String?, QQueryOperations>
      verseNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verseNumber');
    });
  }

  QueryBuilder<ChapterDetailedModel, int?, QQueryOperations>
      verseNumberIntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verseNumberInt');
    });
  }

  QueryBuilder<ChapterDetailedModel, String?, QQueryOperations>
      wordMeaningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordMeanings');
    });
  }
}
