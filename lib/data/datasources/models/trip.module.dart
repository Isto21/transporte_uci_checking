import 'package:transporte_uci_checking/data/datasources/models/enums/trip_status_enum.dart';
import 'package:transporte_uci_checking/data/datasources/models/request.module.dart';

class Trip {
  final int? id;
  final String date;
  final String departureTime;
  final String returnTime;
  final TripStatusEnum status;
  final List<Request>? requests;

  Trip({
    this.id,
    required this.date,
    required this.departureTime,
    required this.returnTime,
    this.status = TripStatusEnum.READY,
    this.requests,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    List<Request>? requestList;
    if (json['requests'] != null) {
      requestList =
          (json['requests'] as List)
              .map((request) => Request.fromJson(request))
              .toList();
    }

    return Trip(
      id: json['id'],
      date: json['date'],
      departureTime: json['departureTime'],
      returnTime: json['returnTime'],
      status: TripStatusEnumExtension.fromString(json['status']),
      requests: requestList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'departureTime': departureTime,
      'returnTime': returnTime,
      'status': status.value,
      'requests': requests?.map((request) => request.toJson()).toList(),
    };
  }

  Trip copyWith({
    int? id,
    String? date,
    String? departureTime,
    String? returnTime,
    TripStatusEnum? status,
    List<Request>? requests,
  }) {
    return Trip(
      id: id ?? this.id,
      date: date ?? this.date,
      departureTime: departureTime ?? this.departureTime,
      returnTime: returnTime ?? this.returnTime,
      status: status ?? this.status,
      requests: requests ?? this.requests,
    );
  }
}
