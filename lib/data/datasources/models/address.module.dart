import 'package:transporte_uci_checking/data/datasources/models/client.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/request.module.dart';

class Address {
  final int? id;
  final String coordinates;
  final String street;
  final String number;
  final String municipality;
  final ClientModel? client;
  final List<Request>? requests;

  Address({
    this.id,
    required this.coordinates,
    required this.street,
    required this.number,
    required this.municipality,
    this.client,
    this.requests,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    List<Request>? requestList;
    if (json['requests'] != null) {
      requestList =
          (json['requests'] as List)
              .map((request) => Request.fromJson(request))
              .toList();
    }

    return Address(
      id: json['id'],
      coordinates: json['coordinates'],
      street: json['street'],
      number: json['number'],
      municipality: json['municipality'],
      client:
          json['client'] != null ? ClientModel.fromJson(json['client']) : null,
      requests: requestList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coordinates': coordinates,
      'street': street,
      'number': number,
      'municipality': municipality,
      'client': client?.toJson(),
      'requests': requests?.map((request) => request.toJson()).toList(),
    };
  }

  Address copyWith({
    int? id,
    String? coordinates,
    String? street,
    String? number,
    String? municipality,
    ClientModel? client,
    List<Request>? requests,
  }) {
    return Address(
      id: id ?? this.id,
      coordinates: coordinates ?? this.coordinates,
      street: street ?? this.street,
      number: number ?? this.number,
      municipality: municipality ?? this.municipality,
      client: client ?? this.client,
      requests: requests ?? this.requests,
    );
  }
}
