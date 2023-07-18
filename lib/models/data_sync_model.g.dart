// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_sync_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDataSyncModelCollection on Isar {
  IsarCollection<DataSyncModel> get dataSyncModels => this.collection();
}

final DataSyncModelSchema = CollectionSchema(
  name: r'DataSyncModel',
  id: BigInt.parse("1492458100214030889").toInt(),
  properties: {
    r'name': PropertySchema(
      id: BigInt.parse("0").toInt(),
      name: r'name',
      type: IsarType.string,
    ),
    r'successStatus': PropertySchema(
      id: BigInt.parse("1").toInt(),
      name: r'successStatus',
      type: IsarType.bool,
    )
  },
  estimateSize: _dataSyncModelEstimateSize,
  serialize: _dataSyncModelSerialize,
  deserialize: _dataSyncModelDeserialize,
  deserializeProp: _dataSyncModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dataSyncModelGetId,
  getLinks: _dataSyncModelGetLinks,
  attach: _dataSyncModelAttach,
  version: '3.1.0',
);

int _dataSyncModelEstimateSize(
  DataSyncModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dataSyncModelSerialize(
  DataSyncModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeBool(offsets[1], object.successStatus);
}

DataSyncModel _dataSyncModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DataSyncModel();
  object.id = id;
  object.name = reader.readStringOrNull(offsets[0]);
  object.successStatus = reader.readBoolOrNull(offsets[1]);
  return object;
}

P _dataSyncModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dataSyncModelGetId(DataSyncModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dataSyncModelGetLinks(DataSyncModel object) {
  return [];
}

void _dataSyncModelAttach(
    IsarCollection<dynamic> col, Id id, DataSyncModel object) {
  object.id = id;
}

extension DataSyncModelQueryWhereSort
    on QueryBuilder<DataSyncModel, DataSyncModel, QWhere> {
  QueryBuilder<DataSyncModel, DataSyncModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DataSyncModelQueryWhere
    on QueryBuilder<DataSyncModel, DataSyncModel, QWhereClause> {
  QueryBuilder<DataSyncModel, DataSyncModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterWhereClause> idBetween(
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

extension DataSyncModelQueryFilter
    on QueryBuilder<DataSyncModel, DataSyncModel, QFilterCondition> {
  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
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

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      successStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'successStatus',
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      successStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'successStatus',
      ));
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterFilterCondition>
      successStatusEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'successStatus',
        value: value,
      ));
    });
  }
}

extension DataSyncModelQueryObject
    on QueryBuilder<DataSyncModel, DataSyncModel, QFilterCondition> {}

extension DataSyncModelQueryLinks
    on QueryBuilder<DataSyncModel, DataSyncModel, QFilterCondition> {}

extension DataSyncModelQuerySortBy
    on QueryBuilder<DataSyncModel, DataSyncModel, QSortBy> {
  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy>
      sortBySuccessStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successStatus', Sort.asc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy>
      sortBySuccessStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successStatus', Sort.desc);
    });
  }
}

extension DataSyncModelQuerySortThenBy
    on QueryBuilder<DataSyncModel, DataSyncModel, QSortThenBy> {
  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy>
      thenBySuccessStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successStatus', Sort.asc);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QAfterSortBy>
      thenBySuccessStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'successStatus', Sort.desc);
    });
  }
}

extension DataSyncModelQueryWhereDistinct
    on QueryBuilder<DataSyncModel, DataSyncModel, QDistinct> {
  QueryBuilder<DataSyncModel, DataSyncModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DataSyncModel, DataSyncModel, QDistinct>
      distinctBySuccessStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'successStatus');
    });
  }
}

extension DataSyncModelQueryProperty
    on QueryBuilder<DataSyncModel, DataSyncModel, QQueryProperty> {
  QueryBuilder<DataSyncModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DataSyncModel, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<DataSyncModel, bool?, QQueryOperations> successStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'successStatus');
    });
  }
}
