import 'package:transporte_uci_checking/data/datasources/models/enums/transport_status_enum.dart';

class Transport {
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

  Transport({
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

  factory Transport.fromJson(Map<String, dynamic> json) {
    return Transport(
      id: json['id'],
      registration: json['registration'],
      driverName: json['driverName'],
      driverPhone: json['driverPhone'],
      capacity: json['capacity'],
      color: json['color'],
      type: json['type'],
      brand: json['brand'],
      status: TransportStatusEnumExtension.fromString(json['status']),
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'registration': registration,
      'driverName': driverName,
      'driverPhone': driverPhone,
      'capacity': capacity,
      'color': color,
      'type': type,
      'brand': brand,
      'status': status.value,
      'photo': photo,
    };
  }

  Transport copyWith({
    int? id,
    String? registration,
    String? driverName,
    String? driverPhone,
    int? capacity,
    String? color,
    String? type,
    String? brand,
    TransportStatusEnum? status,
    String? photo,
  }) {
    return Transport(
      id: id ?? this.id,
      registration: registration ?? this.registration,
      driverName: driverName ?? this.driverName,
      driverPhone: driverPhone ?? this.driverPhone,
      capacity: capacity ?? this.capacity,
      color: color ?? this.color,
      type: type ?? this.type,
      brand: brand ?? this.brand,
      status: status ?? this.status,
      photo: photo ?? this.photo,
    );
  }
}
