import 'package:transporte_uci_checking/domain/entities/user.dart';

abstract class UserRemoteRepository {
  Future<dynamic> registerDirector({
    required String name,
    required String lastName,
    required String email,
    required String rol,
    required String cardNumber,
  });
  Future<dynamic> registerCustomer({
    required String name,
    required String lastName,
    required String email,
    required String rol,
    required String cardNumber,
  });

  Future<List<UserEnity>> getAll();
  // Future<UserEnity> me(int id);
  Future<void> editDirector({
    required int id,
    required String name,
    required String lastName,
    required String email,
    required String rol,
  });

  Future<void> editCustomer({
    required int id,
    required String name,
    required String lastName,
    required String email,
    required String rol,
  });
  Future<void> deleteDirector(int id);
  Future<void> deleteCustomer(int id);
  Future<UserEnity> getUserById(int id);
  Future<UserEnity> getUserByCardNumber(String cardNumber);
}
