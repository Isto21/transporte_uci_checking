import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/request.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/request_remote_repositoy.dart';

class RequestApi extends RequestRemoteRepository {
  final MyDio _myDio;
  final String path = "/request";
  RequestApi(this._myDio);
  @override
  Future<void> delete(int id) async {
    try {
      await _myDio.request(
        requestType: RequestType.DELETE,
        path: '$path/request/$id',
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<List<RequestEntity>> getAll() async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/request',
      );
      final List<RequestEntity> request =
          json['data']['requests']
              .map<RequestEntity>((request) => RequestEntity.fromMap(request))
              .toList();
      return request;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<RequestEntity> getById(int id) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/request/$id',
      );
      final RequestEntity request = RequestEntity.fromMap(
        json['data']['request'],
      );
      return request;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> postRequest(RequestEntity request) async {
    try {
      await _myDio.request(
        requestType: RequestType.POST,
        path: '$path/request',
        data: request.toMap(),
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }
}
