import 'package:transporte_uci_checking/domain/entities/address.dart';

abstract class AddressRemoteRepository {
  Future<void> postAddress(AddressEntity address);
  Future<List<AddressEntity>> getAllByClientId(String acronym);
  Future<List<AddressEntity>> getById(int id);
  Future<void> edit(AddressEntity address);
  // Future<List<AddressEntity>> getAll();
  Future<void> delete(int id);
}
