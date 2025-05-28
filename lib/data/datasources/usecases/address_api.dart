import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/address.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/address_remote_repository.dart';

class AddressApi extends AddressRemoteRepository {
  final MyDio _myDio;

  AddressApi(this._myDio);

  final String path = "address";

  @override
  Future<void> delete(int id) async {
    try {
      await _myDio.request(requestType: RequestType.DELETE, path: "$path/$id");
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> edit(AddressEntity address) async {
    try {
      await _myDio.request(
        requestType: RequestType.PATCH,
        path: "$path/${address.id}",
        data: address.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AddressEntity>> getAllByClientId(String acronym) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/$acronym',
      );
      final List<AddressEntity> request =
          json['data']['address']
              .map<AddressEntity>((request) => AddressEntity.fromMap(request))
              .toList();
      return request;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<List<AddressEntity>> getById(int id) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/$id',
      );
      final List<AddressEntity> request =
          json['data']['address']
              .map<AddressEntity>((request) => AddressEntity.fromMap(request))
              .toList();
      return request;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> postAddress(AddressEntity address) async {
    try {
      await _myDio.request(
        requestType: RequestType.POST,
        path: path,
        data: address.toMap(),
      );
    } on CustomDioError catch (_) {
      rethrow;
    }
  }
}
