// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/config/router/router.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';
import 'package:transporte_uci_checking/presentation/providers/data/api_provider.riverpod.dart';

final accountProvider = StateNotifierProvider<AccountNotifier, AccountStatus>((
  ref,
) {
  final account = ref.read(apiProvider).auth;
  final router = ref.read(routerProvider);
  return AccountNotifier(router: router, accountRemoteRepository: account);
});

class AccountNotifier extends StateNotifier<AccountStatus> {
  AuthRemoteRepository accountRemoteRepository;
  GoRouter router;
  AccountNotifier({required this.accountRemoteRepository, required this.router})
    : super(AccountStatus());

  // Future<void> _verifyToken() async {
  //   final accessToken =
  //       Prefs.instance.getValue(ConstantsSharedPrefs.accessToken);
  //   if (accessToken.isNotEmpty ||
  //       Prefs.instance.getValue(ConstantsSharedPrefs.mark) ==
  //           ApkConstants.isLogged) {
  //     // state = state.copyWith(isVerifyToken: true);
  //     try {
  //       await _mustRefreshToken();
  //       return;
  //     } on CustomDioError catch (e) {
  //       if (e.code == int.parse(ErrorsConsts.expired_token)) {
  //         await logout();
  //       }
  //     } catch (e) {
  //       rethrow;
  //     }
  //     state = state.copyWith(isVerifyToken: false);
  //   }
  // }

  Future<String> login({
    required String usernameOrEmail,
    required String password,
    required String? firebaseToken,
  }) async {
    try {
      await accountRemoteRepository.loginClient(
        usernameOrEmail: usernameOrEmail,
        password: password,
        loginCallback: ({accesToken, refresherToken}) {
          Prefs.instance.saveValue(
            ConstantsSharedPrefs.accessToken,
            accesToken,
          );
        },
      );

      return ErrorsConsts.ok;
    } on CustomDioError catch (_) {
      rethrow;
    }
  }

  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await accountRemoteRepository.changePassword(
        old_password: oldPassword,
        new_password: newPassword,
      );
      return ErrorsConsts.ok;
    } on CustomDioError catch (_) {
      rethrow;
    }
  }
}

class AccountStatus {
  bool isValid;
  bool isVerifyToken;
  AccountStatus({this.isValid = false, this.isVerifyToken = false});

  AccountStatus copyWith({bool? isValid, bool? isVerifyToken}) {
    return AccountStatus(
      isValid: isValid ?? this.isValid,
      isVerifyToken: isVerifyToken ?? this.isVerifyToken,
    );
  }
}
