import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RequestEntity {
  final int? id;
  final String? areaYouRequest;
  final String? workers;
  final String? addressId;
  final String? date;
  final String? departureTime;
  final bool? isAoutbound;
  final String? returnTime;
  final bool? isInbound;
  RequestEntity({
    this.id,
    required this.areaYouRequest,
    required this.workers,
    this.addressId,
    required this.date,
    this.departureTime,
    this.isAoutbound,
    this.returnTime,
    this.isInbound,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'areaYouRequest': areaYouRequest,
      'workers': workers,
      'addressId': addressId,
      'date': date,
      'departureTime': departureTime,
      'isAoutbound': isAoutbound,
      'returnTime': returnTime,
      'isInbound': isInbound,
    };
  }

  factory RequestEntity.fromMap(Map<String, dynamic> map) {
    return RequestEntity(
      id: map['id'] != null ? map['id'] as int : null,
      areaYouRequest: map['areaYouRequest'] as String,
      workers: map['workers'] as String,
      addressId: map['addressId'] != null ? map['addressId'] as String : null,
      date: map['date'] as String,
      departureTime:
          map['departureTime'] != null ? map['departureTime'] as String : null,
      isAoutbound:
          map['isAoutbound'] != null ? map['isAoutbound'] as bool : null,
      returnTime:
          map['returnTime'] != null ? map['returnTime'] as String : null,
      isInbound: map['isInbound'] != null ? map['isInbound'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestEntity.fromJson(String source) =>
      RequestEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
