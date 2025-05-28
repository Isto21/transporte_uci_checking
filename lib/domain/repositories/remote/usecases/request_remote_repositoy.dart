import 'package:transporte_uci_checking/domain/entities/request.dart';

abstract class RequestRemoteRepository {
  Future<void> postRequest(RequestEntity request);
  Future<List<RequestEntity>> getAll();
  Future<RequestEntity> getById(int id);
  Future<void> delete(int id);
}
