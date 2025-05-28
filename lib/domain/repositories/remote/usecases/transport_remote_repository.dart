import 'package:transporte_uci_checking/domain/entities/transport.dart';

abstract class TransportRemoteRepository {
  Future<void> postTransport(TransportEntity transport);
  Future<List<TransportEntity>> getAll();
  Future<TransportEntity> getById(int id);
  Future<void> delete(int id);
  Future<void> edit(TransportEntity transport);
}
