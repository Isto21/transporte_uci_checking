import 'package:transporte_uci_checking/domain/entities/client.dart';

abstract class AuthRemoteRepository {
  Future loginClient({
    required String usernameOrEmail,
    required String password,
    required Function({String? accesToken}) loginCallback,
    // String firebaseToken
  });

  Future<ClientEntity> me();

  Future<dynamic> changePassword({
    required String old_password,
    required String new_password,
  });

  Future<dynamic> forgotPassword({required String email});

  Future<dynamic> verifyForgotPassword({
    required String email,
    required String verification_code,
    required String new_password,
  });
}
