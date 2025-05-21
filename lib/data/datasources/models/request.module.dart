import 'package:transporte_uci_checking/data/datasources/models/address.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/enums/request_status_enum.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';

class Request {
  final int? id;
  final String areaYouRequest;
  final String date;
  final String? departureTime;
  final bool? isAoutbound;
  final String? returnTime;
  final bool? isInbound;
  final int numberOfPeople;
  final RequestStatusEnum status;
  final Address? address;
  final Trip? trip;

  Request({
    this.id,
    required this.areaYouRequest,
    required this.date,
    this.departureTime,
    this.isAoutbound,
    this.returnTime,
    this.isInbound,
    required this.numberOfPeople,
    this.status = RequestStatusEnum.PENDING,
    this.address,
    this.trip,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id'],
      areaYouRequest: json['areaYouRequest'],
      date: json['date'],
      departureTime: json['departureTime'],
      isAoutbound: json['isAoutbound'],
      returnTime: json['returnTime'],
      isInbound: json['isInbound'],
      numberOfPeople: json['numberOfPeople'],
      status: RequestStatusEnumExtension.fromString(json['status']),
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      trip: json['trip'] != null ? Trip.fromJson(json['trip']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'areaYouRequest': areaYouRequest,
      'date': date,
      'departureTime': departureTime,
      'isAoutbound': isAoutbound,
      'returnTime': returnTime,
      'isInbound': isInbound,
      'numberOfPeople': numberOfPeople,
      'status': status.value,
      'address': address?.toJson(),
      'trip': trip?.toJson(),
    };
  }

  Request copyWith({
    int? id,
    String? areaYouRequest,
    String? date,
    String? departureTime,
    bool? isAoutbound,
    String? returnTime,
    bool? isInbound,
    int? numberOfPeople,
    RequestStatusEnum? status,
    Address? address,
    Trip? trip,
  }) {
    return Request(
      id: id ?? this.id,
      areaYouRequest: areaYouRequest ?? this.areaYouRequest,
      date: date ?? this.date,
      departureTime: departureTime ?? this.departureTime,
      isAoutbound: isAoutbound ?? this.isAoutbound,
      returnTime: returnTime ?? this.returnTime,
      isInbound: isInbound ?? this.isInbound,
      numberOfPeople: numberOfPeople ?? this.numberOfPeople,
      status: status ?? this.status,
      address: address ?? this.address,
      trip: trip ?? this.trip,
    );
  }
}
