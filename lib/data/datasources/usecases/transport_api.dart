import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/transport.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/transport_remote_repository.dart';

class TransportApi extends TransportRemoteRepository {
  final MyDio _myDio;
  final String path = "/transport";
  TransportApi(this._myDio);
  @override
  Future<void> delete(int id) async {
    try {
      await _myDio.request(
        requestType: RequestType.DELETE,
        path: '$path/transport/$id',
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> edit(TransportEntity transport) async {
    try {
      await _myDio.request(
        requestType: RequestType.PATCH,
        path: '$path/transport/$transport.id',
        data: transport.toMap(),
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<List<TransportEntity>> getAll() async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/transport',
      );
      final List<TransportEntity> transport =
          json['data']['transports']
              .map<TransportEntity>(
                (transport) => TransportEntity.fromMap(transport),
              )
              .toList();
      return transport;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<TransportEntity> getById(int id) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/transport/$id',
      );
      final TransportEntity transport = TransportEntity.fromMap(
        json['data']['transport'],
      );
      return transport;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> postTransport(TransportEntity transport) async {
    try {
      await _myDio.request(
        requestType: RequestType.POST,
        path: '$path/transport',
        data: transport.toMap(),
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }
}
