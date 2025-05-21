import 'package:transporte_uci_checking/data/datasources/models/enums/role_enum.dart';

class UserEnity {
  final int? id;
  final String name;
  final String lastName;
  final String email;
  final String? password;
  final int createdAt;
  final RoleEnum role;

  UserEnity({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    this.password,
    required this.createdAt,
    this.role = RoleEnum.DIRECTOR_CENTRO,
  });
}
