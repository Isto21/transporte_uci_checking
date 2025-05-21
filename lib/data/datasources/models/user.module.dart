import 'package:transporte_uci_checking/data/datasources/models/enums/role_enum.dart';

class User {
  final int? id;
  final String name;
  final String lastName;
  final String email;
  final String? password;
  final int createdAt;
  final RoleEnum role;

  User({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    this.password,
    required this.createdAt,
    this.role = RoleEnum.DIRECTOR_CENTRO,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      createdAt: json['createdAt'],
      role: RoleEnumExtension.fromString(json['role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'createdAt': createdAt,
      'role': role.value,
    };
  }

  User copyWith({
    int? id,
    String? name,
    String? lastName,
    String? email,
    String? password,
    int? createdAt,
    RoleEnum? role,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      role: role ?? this.role,
    );
  }
}
