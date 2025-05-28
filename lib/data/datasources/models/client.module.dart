// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClientModel {
  final int? id;
  final String name;
  final String acronym;
  // final List<Address>? addresses;

  ClientModel({
    this.id,
    required this.name,
    required this.acronym,
    // this.addresses,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'acronym': acronym};
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      acronym: map['acronym'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
