// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transport {
  final int? id;
  final String registration;
  final String driverName;
  final String? driverPhone;
  final int capacity;
  final String? color;
  final String type;
  final String brand;
  // final TransportStatusEnum status;
  // final String? photo;

  Transport({
    this.id,
    required this.registration,
    required this.driverName,
    this.driverPhone,
    required this.capacity,
    this.color,
    required this.type,
    required this.brand,
    // this.status = TransportStatusEnum.GOOD,
    // this.photo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'registration': registration,
      'driverName': driverName,
      'driverPhone': driverPhone,
      'capacity': capacity,
      'color': color,
      'type': type,
      'brand': brand,
    };
  }

  factory Transport.fromMap(Map<String, dynamic> map) {
    return Transport(
      id: map['id'] != null ? map['id'] as int : null,
      registration: map['registration'] as String,
      driverName: map['driverName'] as String,
      driverPhone:
          map['driverPhone'] != null ? map['driverPhone'] as String : null,
      capacity: map['capacity'] as int,
      color: map['color'] != null ? map['color'] as String : null,
      type: map['type'] as String,
      brand: map['brand'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transport.fromJson(String source) =>
      Transport.fromMap(json.decode(source) as Map<String, dynamic>);
}
