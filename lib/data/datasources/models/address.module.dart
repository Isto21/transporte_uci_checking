// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  final int? id;
  final String coordinates;
  final String street;
  final String number;
  final String municipality;
  final String? clientId;
  Address({
    this.id,
    required this.coordinates,
    required this.street,
    required this.number,
    required this.municipality,
    this.clientId,
  });
  // final List<Request>? requests;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'coordinates': coordinates,
      'street': street,
      'number': number,
      'municipality': municipality,
      'clientId': clientId,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] != null ? map['id'] as int : null,
      coordinates: map['coordinates'] as String,
      street: map['street'] as String,
      number: map['number'] as String,
      municipality: map['municipality'] as String,
      clientId: map['clientId'] != null ? map['clientId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
