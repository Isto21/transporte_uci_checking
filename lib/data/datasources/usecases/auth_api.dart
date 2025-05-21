import 'package:transporte_uci_checking/data/datasources/mappers/mappers.dart';
import 'package:transporte_uci_checking/data/datasources/models/client.module.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/client.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';

class AuthApi extends AuthRemoteRepository {
  final MyDio _myDio;

  AuthApi(this._myDio);

  final String path = "auth";

  @override
  Future loginClient({
    required String usernameOrEmail,
    required String password,
    required Function({String? accesToken}) loginCallback,
  }) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.POST,
        path: '$path/login',
        data: {"email": usernameOrEmail, "password": password},
      );
      final String? accesToken = json["data"]["token"];
      // final String? refresherToken = json["refresh_token"];

      if (accesToken != null) {
        _myDio.updateToken(accesToken);
      }
      loginCallback(accesToken: accesToken);
    } on CustomDioError catch (e) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<ClientEntity> me() async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '$path/users/me',
      );
      final ClientEntity user = Mappers().clientMapperToEntity(
        ClientModel.fromJson(json),
      );
      return user;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<bool> changePassword({
    required String old_password,
    required String new_password,
  }) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.POST,
        path: '$path/changePassword',
        data: {"old_password": old_password, "new_password": new_password},
      );
      return true;
    } on CustomDioError catch (e) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future forgotPassword({required String email}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future verifyForgotPassword({
    required String email,
    required String verification_code,
    required String new_password,
  }) {
    // TODO: implement verifyForgotPassword
    throw UnimplementedError();
  }
}
