import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/client.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/client_remote_reposiroty.dart';

class ClientApi extends ClientRemoteRepository {
  final MyDio _myDio;
  final String path = "client";
  ClientApi(this._myDio);

  @override
  Future<void> delete(int id) async {
    try {
      await _myDio.request(
        requestType: RequestType.DELETE,
        path: '$path/client/$id',
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> edit(ClientEntity client) async {
    try {
      await _myDio.request(
        requestType: RequestType.PATCH,
        path: '$path/client/$client.id',
        data: client.toMap(),
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<List<ClientEntity>> getAll() async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/client',
      );
      final List<ClientEntity> request =
          json['data']['client']
              .map<ClientEntity>((request) => ClientEntity.fromMap(request))
              .toList();
      return request;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<ClientEntity> getById(int id) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/client/$id',
      );
      final ClientEntity request = ClientEntity.fromMap(json['data']['client']);
      return request;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> postClient(ClientEntity client) async {
    try {
      await _myDio.request(
        requestType: RequestType.POST,
        path: path,
        data: client.toMap(),
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }
}
