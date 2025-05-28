import 'package:transporte_uci_checking/data/datasources/mappers/mappers.dart';
import 'package:transporte_uci_checking/data/datasources/models/user.module.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/user.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/user_remote_repository.dart';

class UserApi extends UserRemoteRepository {
  final MyDio _myDio;

  UserApi(this._myDio);

  final String path = "user";

  @override
  Future<void> deleteCustomer(int id) async {
    try {
      await _myDio.request(
        requestType: RequestType.DELETE,
        path: '$path/deleteCustomer/$id',
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> deleteDirector(int id) async {
    try {
      await _myDio.request(
        requestType: RequestType.DELETE,
        path: '$path/deleteDirector/$id',
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> editCustomer({
    required int id,
    required String name,
    required String lastName,
    required String email,
    required String rol,
  }) async {
    try {
      await _myDio.request(
        requestType: RequestType.PATCH,
        path: '$path/editCustomer/$id',
        data: {"name": name, "lastName": lastName, "email": email, "rol": rol},
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> editDirector({
    required int id,
    required String name,
    required String lastName,
    required String email,
    required String rol,
  }) async {
    try {
      await _myDio.request(
        requestType: RequestType.PATCH,
        path: '$path/editDirector/$id',
        data: {"name": name, "lastName": lastName, "email": email, "rol": rol},
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<List<UserEnity>> getAll() async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/getAll',
      );
      final List<UserEnity> user = Mappers().listUserMapperToEntity(
        List<User>.from(
          (json['data']['users'] as List<dynamic>).map<User>(
            (x) => User.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

      return user;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<UserEnity> getUserByCardNumber(String cardNumber) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/getUserByCardNumber/$cardNumber',
      );
      final UserEnity user = Mappers().userMapperToEntity(User.fromMap(json));
      return user;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<UserEnity> getUserById(int id) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/getUserById/$id',
      );
      final UserEnity user = Mappers().userMapperToEntity(User.fromMap(json));
      return user;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future registerCustomer({
    required String name,
    required String lastName,
    required String email,
    required String rol,
    required String cardNumber,
  }) async {
    try {
      await _myDio.request(
        requestType: RequestType.POST,
        path: '$path/registerCustomer',
        data: {
          "name": name,
          "lastName": lastName,
          "email": email,
          "rol": rol,
          "cardNumber": cardNumber,
        },
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future registerDirector({
    required String name,
    required String lastName,
    required String email,
    required String rol,
    required String cardNumber,
  }) async {
    try {
      await _myDio.request(
        requestType: RequestType.POST,
        path: '$path/registerDirector',
        data: {
          "name": name,
          "lastName": lastName,
          "email": email,
          "rol": rol,
          "cardNumber": cardNumber,
        },
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }
}
