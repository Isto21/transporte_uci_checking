import 'package:transporte_uci_checking/domain/entities/client.dart';
import 'package:transporte_uci_checking/domain/entities/request.dart';

class AddressEntity {
  final int? id;
  final String coordinates;
  final String street;
  final String number;
  final String municipality;
  final ClientEntity? client;
  final List<RequestEntity>? requests;

  AddressEntity({
    this.id,
    required this.coordinates,
    required this.street,
    required this.number,
    required this.municipality,
    this.client,
    this.requests,
  });
}
