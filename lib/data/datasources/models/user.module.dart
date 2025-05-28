// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:transporte_uci_checking/data/datasources/models/enums/role_enum.dart';

class User {
  final int? id;
  final String name;
  final String lastName;
  final String email;
  final String? password;
  final RoleEnum role;
  final String? cardNumber;

  User({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    this.password,
    this.cardNumber,
    this.role = RoleEnum.DIRECTOR_CENTRO,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'role': role.value,
      'cardNumber': cardNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      role: RoleEnumExtension.fromString(map['role'] as String),
      cardNumber: map['cardNumber'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
