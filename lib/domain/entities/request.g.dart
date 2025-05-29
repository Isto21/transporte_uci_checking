// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RequestEntitySchema = Schema(
  name: r'RequestEntity',
  id: 3312927130581692652,
  properties: {
    r'addressId': PropertySchema(
      id: 0,
      name: r'addressId',
      type: IsarType.string,
    ),
    r'areaYouRequest': PropertySchema(
      id: 1,
      name: r'areaYouRequest',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.string,
    ),
    r'departureTime': PropertySchema(
      id: 3,
      name: r'departureTime',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.long,
    ),
    r'isAoutbound': PropertySchema(
      id: 5,
      name: r'isAoutbound',
      type: IsarType.bool,
    ),
    r'isInbound': PropertySchema(
      id: 6,
      name: r'isInbound',
      type: IsarType.bool,
    ),
    r'returnTime': PropertySchema(
      id: 7,
      name: r'returnTime',
      type: IsarType.string,
    ),
    r'workers': PropertySchema(
      id: 8,
      name: r'workers',
      type: IsarType.string,
    )
  },
  estimateSize: _requestEntityEstimateSize,
  serialize: _requestEntitySerialize,
  deserialize: _requestEntityDeserialize,
  deserializeProp: _requestEntityDeserializeProp,
);

int _requestEntityEstimateSize(
  RequestEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.addressId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.areaYouRequest;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.returnTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.workers;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _requestEntitySerialize(
  RequestEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.addressId);
  writer.writeString(offsets[1], object.areaYouRequest);
  writer.writeString(offsets[2], object.date);
  writer.writeString(offsets[3], object.departureTime);
  writer.writeLong(offsets[4], object.id);
  writer.writeBool(offsets[5], object.isAoutbound);
  writer.writeBool(offsets[6], object.isInbound);
  writer.writeString(offsets[7], object.returnTime);
  writer.writeString(offsets[8], object.workers);
}

RequestEntity _requestEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RequestEntity(
    addressId: reader.readStringOrNull(offsets[0]),
    areaYouRequest: reader.readStringOrNull(offsets[1]),
    date: reader.readStringOrNull(offsets[2]),
    departureTime: reader.readStringOrNull(offsets[3]),
    id: reader.readLongOrNull(offsets[4]),
    isAoutbound: reader.readBoolOrNull(offsets[5]),
    isInbound: reader.readBoolOrNull(offsets[6]),
    returnTime: reader.readStringOrNull(offsets[7]),
    workers: reader.readStringOrNull(offsets[8]),
  );
  return object;
}

P _requestEntityDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RequestEntityQueryFilter
    on QueryBuilder<RequestEntity, RequestEntity, QFilterCondition> {
  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'addressId',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'addressId',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'addressId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'addressId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'addressId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'addressId',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      addressIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'addressId',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'areaYouRequest',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'areaYouRequest',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaYouRequest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'areaYouRequest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'areaYouRequest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'areaYouRequest',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'areaYouRequest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'areaYouRequest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'areaYouRequest',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'areaYouRequest',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaYouRequest',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      areaYouRequestIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'areaYouRequest',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition> dateEqualTo(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateGreaterThan(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateLessThan(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateStartsWith(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateEndsWith(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition> dateMatches(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      departureTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      departureTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'departureTime',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      departureTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'departureTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      departureTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'departureTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      departureTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'departureTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      departureTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'departureTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      isAoutboundIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isAoutbound',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      isAoutboundIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isAoutbound',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      isAoutboundEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAoutbound',
        value: value,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      isInboundIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isInbound',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      isInboundIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isInbound',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      isInboundEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInbound',
        value: value,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'returnTime',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'returnTime',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeEqualTo(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeBetween(
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
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

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'returnTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'returnTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      returnTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'returnTime',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workers',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workers',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workers',
        value: '',
      ));
    });
  }

  QueryBuilder<RequestEntity, RequestEntity, QAfterFilterCondition>
      workersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workers',
        value: '',
      ));
    });
  }
}

extension RequestEntityQueryObject
    on QueryBuilder<RequestEntity, RequestEntity, QFilterCondition> {}
