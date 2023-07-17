// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_read_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLastReadModelCollection on Isar {
  IsarCollection<LastReadModel> get lastReadModels => this.collection();
}

const LastReadModelSchema = CollectionSchema(
  name: r'LastReadModel',
  id: 8180444031845871040,
  properties: {
    r'chapterNumber': PropertySchema(
      id: 0,
      name: r'chapterNumber',
      type: IsarType.long,
    ),
    r'lastReadVerseNum': PropertySchema(
      id: 1,
      name: r'lastReadVerseNum',
      type: IsarType.string,
    ),
    r'lastReadVerseText': PropertySchema(
      id: 2,
      name: r'lastReadVerseText',
      type: IsarType.string,
    ),
    r'verseNumber': PropertySchema(
      id: 3,
      name: r'verseNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _lastReadModelEstimateSize,
  serialize: _lastReadModelSerialize,
  deserialize: _lastReadModelDeserialize,
  deserializeProp: _lastReadModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _lastReadModelGetId,
  getLinks: _lastReadModelGetLinks,
  attach: _lastReadModelAttach,
  version: '3.1.0+1',
);

int _lastReadModelEstimateSize(
  LastReadModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lastReadVerseNum;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastReadVerseText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _lastReadModelSerialize(
  LastReadModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chapterNumber);
  writer.writeString(offsets[1], object.lastReadVerseNum);
  writer.writeString(offsets[2], object.lastReadVerseText);
  writer.writeLong(offsets[3], object.verseNumber);
}

LastReadModel _lastReadModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LastReadModel();
  object.chapterNumber = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.lastReadVerseNum = reader.readStringOrNull(offsets[1]);
  object.lastReadVerseText = reader.readStringOrNull(offsets[2]);
  object.verseNumber = reader.readLongOrNull(offsets[3]);
  return object;
}

P _lastReadModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lastReadModelGetId(LastReadModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lastReadModelGetLinks(LastReadModel object) {
  return [];
}

void _lastReadModelAttach(
    IsarCollection<dynamic> col, Id id, LastReadModel object) {
  object.id = id;
}

extension LastReadModelQueryWhereSort
    on QueryBuilder<LastReadModel, LastReadModel, QWhere> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LastReadModelQueryWhere
    on QueryBuilder<LastReadModel, LastReadModel, QWhereClause> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterWhereClause> idBetween(
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

extension LastReadModelQueryFilter
    on QueryBuilder<LastReadModel, LastReadModel, QFilterCondition> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      chapterNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      chapterNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chapterNumber',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      chapterNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chapterNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      chapterNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chapterNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      chapterNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chapterNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      chapterNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chapterNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
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

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReadVerseNum',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastReadVerseNum',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadVerseNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReadVerseNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReadVerseNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReadVerseNum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastReadVerseNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastReadVerseNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastReadVerseNum',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastReadVerseNum',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadVerseNum',
        value: '',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseNumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastReadVerseNum',
        value: '',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReadVerseText',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastReadVerseText',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadVerseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReadVerseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReadVerseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReadVerseText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastReadVerseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastReadVerseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastReadVerseText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastReadVerseText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadVerseText',
        value: '',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      lastReadVerseTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastReadVerseText',
        value: '',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      verseNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'verseNumber',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      verseNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'verseNumber',
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      verseNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verseNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      verseNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verseNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      verseNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verseNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterFilterCondition>
      verseNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verseNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LastReadModelQueryObject
    on QueryBuilder<LastReadModel, LastReadModel, QFilterCondition> {}

extension LastReadModelQueryLinks
    on QueryBuilder<LastReadModel, LastReadModel, QFilterCondition> {}

extension LastReadModelQuerySortBy
    on QueryBuilder<LastReadModel, LastReadModel, QSortBy> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      sortByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      sortByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      sortByLastReadVerseNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseNum', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      sortByLastReadVerseNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseNum', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      sortByLastReadVerseText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseText', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      sortByLastReadVerseTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseText', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> sortByVerseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      sortByVerseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.desc);
    });
  }
}

extension LastReadModelQuerySortThenBy
    on QueryBuilder<LastReadModel, LastReadModel, QSortThenBy> {
  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      thenByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      thenByChapterNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapterNumber', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      thenByLastReadVerseNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseNum', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      thenByLastReadVerseNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseNum', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      thenByLastReadVerseText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseText', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      thenByLastReadVerseTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadVerseText', Sort.desc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy> thenByVerseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.asc);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QAfterSortBy>
      thenByVerseNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verseNumber', Sort.desc);
    });
  }
}

extension LastReadModelQueryWhereDistinct
    on QueryBuilder<LastReadModel, LastReadModel, QDistinct> {
  QueryBuilder<LastReadModel, LastReadModel, QDistinct>
      distinctByChapterNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapterNumber');
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QDistinct>
      distinctByLastReadVerseNum({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadVerseNum',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QDistinct>
      distinctByLastReadVerseText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadVerseText',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LastReadModel, LastReadModel, QDistinct>
      distinctByVerseNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verseNumber');
    });
  }
}

extension LastReadModelQueryProperty
    on QueryBuilder<LastReadModel, LastReadModel, QQueryProperty> {
  QueryBuilder<LastReadModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LastReadModel, int?, QQueryOperations> chapterNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapterNumber');
    });
  }

  QueryBuilder<LastReadModel, String?, QQueryOperations>
      lastReadVerseNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadVerseNum');
    });
  }

  QueryBuilder<LastReadModel, String?, QQueryOperations>
      lastReadVerseTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadVerseText');
    });
  }

  QueryBuilder<LastReadModel, int?, QQueryOperations> verseNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verseNumber');
    });
  }
}
