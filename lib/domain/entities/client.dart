import 'package:transporte_uci_checking/domain/entities/address.dart';

class ClientEntity {
  final int? id;
  final String name;
  final String acronym;
  final List<AddressEntity>? addresses;

  ClientEntity({
    this.id,
    required this.name,
    required this.acronym,
    this.addresses,
  });
}
