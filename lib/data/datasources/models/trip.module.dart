// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:transporte_uci_checking/data/datasources/models/enums/trip_status_enum.dart';
import 'package:transporte_uci_checking/data/datasources/models/request.module.dart';

class Trip {
  final int? id;
  final int? transportationId;
  final String? date;
  final String? departureTime;
  final String? returnTime;
  final List<Request>? requests;
  final TripStatusEnum status;

  Trip({
    this.id,
    this.transportationId,
    this.date,
    this.departureTime,
    this.returnTime,
    this.requests,
    this.status = TripStatusEnum.READY,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'transportationId': transportationId,
      'date': date,
      'departureTime': departureTime,
      'returnTime': returnTime,
      'requests': requests?.map((x) => x.toMap()).toList(),
      'status': status.value,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      id: map['id'] != null ? map['id'] as int : null,
      transportationId:
          map['transportationId'] != null
              ? map['transportationId'] as int
              : null,
      date: map['date'] != null ? map['date'] as String : null,
      departureTime:
          map['departureTime'] != null ? map['departureTime'] as String : null,
      returnTime:
          map['returnTime'] != null ? map['returnTime'] as String : null,
      requests:
          map['requests'] != null
              ? List<Request>.from(
                (map['requests'] as List<dynamic>).map<Request?>(
                  (x) => Request.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      status:
          map['status'] != null
              ? TripStatusEnumExtension.fromString(map['status'] as String)
              : TripStatusEnum.READY,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trip.fromJson(String source) =>
      Trip.fromMap(json.decode(source) as Map<String, dynamic>);
}
