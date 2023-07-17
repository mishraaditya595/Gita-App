// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_bookmark_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVerseBookmarkModelCollection on Isar {
  IsarCollection<VerseBookmarkModel> get verseBookmarkModels =>
      this.collection();
}

const VerseBookmarkModelSchema = CollectionSchema(
  name: r'VerseBookmarkModel',
  id: -2019871168349878730,
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
    r'creationTime': PropertySchema(
      id: 2,
      name: r'creationTime',
      type: IsarType.long,
    ),
    r'text': PropertySchema(
      id: 3,
      name: r'text',
      type: IsarType.string,
    ),
    r'translation': PropertySchema(
      id: 4,
      name: r'translation',
      type: IsarType.string,
    ),
    r'transliteration': PropertySchema(
      id: 5,
      name: r'transliteration',
      type: IsarType.string,
    ),
    r'verseNumber': PropertySchema(
      id: 6,
      name: r'verseNumber',
      type: IsarType.string,
    ),
    r'verseNumberInt': PropertySchema(
      id: 7,
      name: r'verseNumberInt',
      type: IsarType.long,
    ),
    r'wordMeanings': PropertySchema(
      id: 8,
      name: r'wordMeanings',
      type: IsarType.string,
    )
  },
  estimateSize: _verseBookmarkModelEstimateSize,
  serialize: _verseBookmarkModelSerialize,
  deserialize: _verseBookmarkModelDeserialize,
  deserializeProp: _verseBookmarkModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _verseBookmarkModelGetId,
  getLinks: _verseBookmarkModelGetLinks,
  attach: _verseBookmarkModelAttach,
  version: '3.1.0+1',
);

int _verseBookmarkModelEstimateSize(
  VerseBookmarkModel object,
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

void _verseBookmarkModelSerialize(
  VerseBookmarkModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chapterNumber);
  writer.writeString(offsets[1], object.commentary);
  writer.writeLong(offsets[2], object.creationTime);
  writer.writeString(offsets[3], object.text);
  writer.writeString(offsets[4], object.translation);
  writer.writeString(offsets[5], object.transliteration);
  writer.writeString(offsets[6], object.verseNumber);
  writer.writeLong(offsets[7], object.verseNumberInt);
  writer.writeString(offsets[8], object.wordMeanings);
}

VerseBookmarkModel _verseBookmarkModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VerseBookmarkModel();
  object.chapterNumber = reader.readStringOrNull(offsets[0]);
  object.commentary = reader.readStringOrNull(offsets[1]);
  object.creationTime = reader.readLongOrNull(offsets[2]);
  object.id = id;
  object.text = reader.readStringOrNull(offsets[3]);
  object.translation = reader.readStringOrNull(offsets[4]);
  object.transliteration = reader.readStringOrNull(offsets[5]);
  object.verseNumber = reader.readStringOrNull(offsets[6]);
  object.verseNumberInt = reader.readLongOrNull(offsets[7]);
  object.wordMeanings = reader.readStringOrNull(offsets[8]);
  return object;
}

P _verseBookmarkModelDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
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
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _verseBookmarkModelGetId(VerseBookmarkModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _verseBookmarkModelGetLinks(
    VerseBookmarkModel object) {
  return [];
}

void _verseBookmarkModelAttach(
    IsarCollection<dynamic> col, Id id, VerseBookmarkModel object) {
  object.id = id;
}

extension VerseBookmarkModelQueryWhereSort
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QWhere> {
  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension VerseBookmarkModelQueryWhere
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QWhereClause> {
  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterWhereClause>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterWhereClause>
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

extension VerseBookmarkModelQueryFilter
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QFilterCondition> {
  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      chapterNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      chapterNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      chapterNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chapterNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      chapterNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chapterNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      chapterNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      chapterNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chapterNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'commentary',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'commentary',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryEqualTo(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryGreaterThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryLessThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryBetween(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryStartsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryEndsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'commentary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'commentary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'commentary',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      commentaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'commentary',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      creationTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'creationTime',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      creationTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'creationTime',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      creationTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      creationTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      creationTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      creationTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'text',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textEqualTo(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textGreaterThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textLessThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textBetween(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textStartsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textEndsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translation',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translation',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationEqualTo(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationGreaterThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationLessThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationBetween(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationStartsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationEndsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translation',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      translationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translation',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transliteration',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transliteration',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationEqualTo(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationGreaterThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationLessThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationBetween(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationStartsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationEndsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transliteration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transliteration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transliteration',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      transliterationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transliteration',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verseNumber',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verseNumber',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberEqualTo(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberGreaterThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberLessThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberBetween(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberStartsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberEndsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'verseNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'verseNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'verseNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIntIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verseNumberInt',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIntIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verseNumberInt',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIntEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verseNumberInt',
        value: value,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIntGreaterThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIntLessThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      verseNumberIntBetween(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wordMeanings',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wordMeanings',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsEqualTo(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsGreaterThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsLessThan(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsBetween(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsStartsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsEndsWith(
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

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wordMeanings',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wordMeanings',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordMeanings',
        value: '',
      ));
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterFilterCondition>
      wordMeaningsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wordMeanings',
        value: '',
      ));
    });
  }
}

extension VerseBookmarkModelQueryObject
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QFilterCondition> {}

extension VerseBookmarkModelQueryLinks
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QFilterCondition> {}

extension VerseBookmarkModelQuerySortBy
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QSortBy> {
  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByCommentary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByCommentaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByCreationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByTranslation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByTranslationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByTransliteration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByTransliterationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByVerseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByVerseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByVerseNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByVerseNumberIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByWordMeanings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      sortByWordMeaningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.desc);
    });
  }
}

extension VerseBookmarkModelQuerySortThenBy
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QSortThenBy> {
  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByCommentary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByCommentaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'commentary', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByCreationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByTranslation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByTranslationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translation', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByTransliteration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByTransliterationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transliteration', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByVerseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByVerseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByVerseNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByVerseNumberIntDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumberInt', Sort.desc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByWordMeanings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.asc);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QAfterSortBy>
      thenByWordMeaningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordMeanings', Sort.desc);
    });
  }
}

extension VerseBookmarkModelQueryWhereDistinct
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct> {
  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByChapterNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByCommentary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'commentary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationTime');
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByTranslation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByTransliteration({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transliteration',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByVerseNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verseNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByVerseNumberInt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verseNumberInt');
    });
  }

  QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QDistinct>
      distinctByWordMeanings({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordMeanings', caseSensitive: caseSensitive);
    });
  }
}

extension VerseBookmarkModelQueryProperty
    on QueryBuilder<VerseBookmarkModel, VerseBookmarkModel, QQueryProperty> {
  QueryBuilder<VerseBookmarkModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VerseBookmarkModel, String?, QQueryOperations>
      chapterNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterNumber');
    });
  }

  QueryBuilder<VerseBookmarkModel, String?, QQueryOperations>
      commentaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'commentary');
    });
  }

  QueryBuilder<VerseBookmarkModel, int?, QQueryOperations>
      creationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationTime');
    });
  }

  QueryBuilder<VerseBookmarkModel, String?, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<VerseBookmarkModel, String?, QQueryOperations>
      translationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translation');
    });
  }

  QueryBuilder<VerseBookmarkModel, String?, QQueryOperations>
      transliterationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transliteration');
    });
  }

  QueryBuilder<VerseBookmarkModel, String?, QQueryOperations>
      verseNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verseNumber');
    });
  }

  QueryBuilder<VerseBookmarkModel, int?, QQueryOperations>
      verseNumberIntProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verseNumberInt');
    });
  }

  QueryBuilder<VerseBookmarkModel, String?, QQueryOperations>
      wordMeaningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordMeanings');
    });
  }
}
