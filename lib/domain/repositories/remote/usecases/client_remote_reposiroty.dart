import 'package:transporte_uci_checking/domain/entities/client.dart';

abstract class ClientRemoteRepository {
  Future<void> postClient(ClientEntity client);
  Future<List<ClientEntity>> getAll();
  Future<ClientEntity> getById(int id);
  Future<void> edit(ClientEntity client);
  Future<void> delete(int id);
}
