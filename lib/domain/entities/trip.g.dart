// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTripEntityCollection on Isar {
  IsarCollection<TripEntity> get tripEntitys => this.collection();
}

const TripEntitySchema = CollectionSchema(
  name: r'TripEntity',
  id: -5096576547797122041,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.string,
    ),
    r'departureTime': PropertySchema(
      id: 1,
      name: r'departureTime',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'requests': PropertySchema(
      id: 3,
      name: r'requests',
      type: IsarType.objectList,
      target: r'RequestEntity',
    ),
    r'returnTime': PropertySchema(
      id: 4,
      name: r'returnTime',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 5,
      name: r'status',
      type: IsarType.byte,
      enumMap: _TripEntitystatusEnumValueMap,
    ),
    r'transportationId': PropertySchema(
      id: 6,
      name: r'transportationId',
      type: IsarType.long,
    )
  },
  estimateSize: _tripEntityEstimateSize,
  serialize: _tripEntitySerialize,
  deserialize: _tripEntityDeserialize,
  deserializeProp: _tripEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'RequestEntity': RequestEntitySchema},
  getId: _tripEntityGetId,
  getLinks: _tripEntityGetLinks,
  attach: _tripEntityAttach,
  version: '3.1.0+1',
);

int _tripEntityEstimateSize(
  TripEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.date;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.departureTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.requests;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[RequestEntity]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              RequestEntitySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.returnTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tripEntitySerialize(
  TripEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeString(offsets[1], object.departureTime);
  writer.writeLong(offsets[2], object.id);
  writer.writeObjectList<RequestEntity>(
    offsets[3],
    allOffsets,
    RequestEntitySchema.serialize,
    object.requests,
  );
  writer.writeString(offsets[4], object.returnTime);
  writer.writeByte(offsets[5], object.status.index);
  writer.writeLong(offsets[6], object.transportationId);
}

TripEntity _tripEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TripEntity(
    date: reader.readStringOrNull(offsets[0]),
    departureTime: reader.readStringOrNull(offsets[1]),
    id: reader.readLongOrNull(offsets[2]),
    requests: reader.readObjectList<RequestEntity>(
      offsets[3],
      RequestEntitySchema.deserialize,
      allOffsets,
      RequestEntity(),
    ),
    returnTime: reader.readStringOrNull(offsets[4]),
    status: _TripEntitystatusValueEnumMap[reader.readByteOrNull(offsets[5])] ??
        TripStatusEnum.READY,
    transportationId: reader.readLongOrNull(offsets[6]),
  );
  return object;
}

P _tripEntityDeserializeProp<P>(
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
      return (reader.readObjectList<RequestEntity>(
        offset,
        RequestEntitySchema.deserialize,
        allOffsets,
        RequestEntity(),
      )) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_TripEntitystatusValueEnumMap[reader.readByteOrNull(offset)] ??
          TripStatusEnum.READY) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TripEntitystatusEnumValueMap = {
  'READY': 0,
  'DONE': 1,
};
const _TripEntitystatusValueEnumMap = {
  0: TripStatusEnum.READY,
  1: TripStatusEnum.DONE,
};

Id _tripEntityGetId(TripEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _tripEntityGetLinks(TripEntity object) {
  return [];
}

void _tripEntityAttach(IsarCollection<dynamic> col, Id id, TripEntity object) {}

extension TripEntityQueryWhereSort
    on QueryBuilder<TripEntity, TripEntity, QWhere> {
  QueryBuilder<TripEntity, TripEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TripEntityQueryWhere
    on QueryBuilder<TripEntity, TripEntity, QWhereClause> {
  QueryBuilder<TripEntity, TripEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TripEntityQueryFilter
    on QueryBuilder<TripEntity, TripEntity, QFilterCondition> {
  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'departureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'departureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'departureTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'departureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'departureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'departureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'departureTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departureTime',
        value: '',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      departureTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'departureTime',
        value: '',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> idGreaterThan(
    int? value, {
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

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> requestsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'requests',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      requestsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'requests',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      requestsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requests',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      requestsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requests',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      requestsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requests',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      requestsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requests',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      requestsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requests',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      requestsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'requests',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnTime',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnTime',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> returnTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> returnTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'returnTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'returnTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'returnTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> returnTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'returnTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnTime',
        value: '',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      returnTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'returnTime',
        value: '',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> statusEqualTo(
      TripStatusEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> statusGreaterThan(
    TripStatusEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> statusLessThan(
    TripStatusEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> statusBetween(
    TripStatusEnum lower,
    TripStatusEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      transportationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transportationId',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      transportationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transportationId',
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      transportationIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transportationId',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      transportationIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transportationId',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      transportationIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transportationId',
        value: value,
      ));
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition>
      transportationIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transportationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TripEntityQueryObject
    on QueryBuilder<TripEntity, TripEntity, QFilterCondition> {
  QueryBuilder<TripEntity, TripEntity, QAfterFilterCondition> requestsElement(
      FilterQuery<RequestEntity> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'requests');
    });
  }
}

extension TripEntityQueryLinks
    on QueryBuilder<TripEntity, TripEntity, QFilterCondition> {}

extension TripEntityQuerySortBy
    on QueryBuilder<TripEntity, TripEntity, QSortBy> {
  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnTime', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByReturnTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnTime', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> sortByTransportationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationId', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy>
      sortByTransportationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationId', Sort.desc);
    });
  }
}

extension TripEntityQuerySortThenBy
    on QueryBuilder<TripEntity, TripEntity, QSortThenBy> {
  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByDepartureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByDepartureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departureTime', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByReturnTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnTime', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByReturnTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnTime', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy> thenByTransportationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationId', Sort.asc);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QAfterSortBy>
      thenByTransportationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transportationId', Sort.desc);
    });
  }
}

extension TripEntityQueryWhereDistinct
    on QueryBuilder<TripEntity, TripEntity, QDistinct> {
  QueryBuilder<TripEntity, TripEntity, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QDistinct> distinctByDepartureTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'departureTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<TripEntity, TripEntity, QDistinct> distinctByReturnTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TripEntity, TripEntity, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<TripEntity, TripEntity, QDistinct> distinctByTransportationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transportationId');
    });
  }
}

extension TripEntityQueryProperty
    on QueryBuilder<TripEntity, TripEntity, QQueryProperty> {
  QueryBuilder<TripEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<TripEntity, String?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<TripEntity, String?, QQueryOperations> departureTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departureTime');
    });
  }

  QueryBuilder<TripEntity, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TripEntity, List<RequestEntity>?, QQueryOperations>
      requestsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requests');
    });
  }

  QueryBuilder<TripEntity, String?, QQueryOperations> returnTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnTime');
    });
  }

  QueryBuilder<TripEntity, TripStatusEnum, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TripEntity, int?, QQueryOperations> transportationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transportationId');
    });
  }
}
