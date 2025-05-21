import 'package:transporte_uci_checking/data/datasources/models/enums/transport_status_enum.dart';

class TransportEntity {
  final int? id;
  final String registration;
  final String driverName;
  final String? driverPhone;
  final int capacity;
  final String? color;
  final String type;
  final String brand;
  final TransportStatusEnum status;
  final String? photo;

  TransportEntity({
    this.id,
    required this.registration,
    required this.driverName,
    this.driverPhone,
    required this.capacity,
    this.color,
    required this.type,
    required this.brand,
    this.status = TransportStatusEnum.GOOD,
    this.photo,
  });
}
