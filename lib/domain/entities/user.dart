// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:transporte_uci_checking/data/datasources/models/enums/role_enum.dart';

class UserEnity {
  final int? id;
  final String? name;
  final String? lastName;
  final String? email;
  final String? password;
  final RoleEnum? role;
  final String? cardNumber;
  UserEnity({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.password,
    this.role,
    this.cardNumber,
  });
}
