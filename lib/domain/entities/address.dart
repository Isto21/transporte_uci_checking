import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddressEntity {
  final int? id;
  final String? coordinates;
  final String? street;
  final String? number;
  final String? municipality;
  final String? clientId;
  AddressEntity({
    this.id,
    this.coordinates,
    this.street,
    this.number,
    this.municipality,
    this.clientId,
  });

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

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      id: map['id'] != null ? map['id'] as int : null,
      coordinates:
          map['coordinates'] != null ? map['coordinates'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      number: map['number'] != null ? map['number'] as String : null,
      municipality:
          map['municipality'] != null ? map['municipality'] as String : null,
      clientId: map['clientId'] != null ? map['clientId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) =>
      AddressEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
