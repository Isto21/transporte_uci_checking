import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ClientEntity {
  final int? id;
  final String name;
  final String acronym;
  ClientEntity({this.id, required this.name, required this.acronym});
  // final List<Address>? addresses;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'acronym': acronym};
  }

  factory ClientEntity.fromMap(Map<String, dynamic> map) {
    return ClientEntity(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      acronym: map['acronym'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientEntity.fromJson(String source) =>
      ClientEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
