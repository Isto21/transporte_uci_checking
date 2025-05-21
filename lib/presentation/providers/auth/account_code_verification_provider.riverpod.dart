import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/account_provider.riverpod.dart';

final verificationCodeProvider =
    StateNotifierProvider<VerificationCodeNotifier, String>((ref) {
      return VerificationCodeNotifier(ref.watch(accountProvider.notifier));
    });

class VerificationCodeNotifier extends StateNotifier<String> {
  final AccountNotifier _accountNotifier;
  VerificationCodeNotifier(this._accountNotifier) : super("");

  Future<String> onSubmit() async {
    try {
      // final String username =
      // Prefs.instance.getValue(ConstantsSharedPrefs.username);
      final String email = Prefs.instance.getValue(ConstantsSharedPrefs.email);
      await _accountNotifier.login(
        usernameOrEmail:
            //  (username.isNotEmpty) ? username :
            email,
        password: Prefs.instance.getValue(ConstantsSharedPrefs.password),
        firebaseToken: '',
      );
      return ErrorsConsts.ok;
    } on CustomDioError catch (e) {
      return e.code.toString();
    }
  }

  void clearPrefs() {
    Prefs.instance.saveValue(ConstantsSharedPrefs.email, '');
    Prefs.instance.saveValue(ConstantsSharedPrefs.password, '');
    // Prefs.instance.saveValue(ConstantsSharedPrefs.username, '');
  }

  Future<bool> resendVerificationEmail(String email) async {
    try {
      // await _accountNotifier.accountRemoteRepository
      //     .resendVerificationEmail(email: email);
      return true;
    } on CustomDioError catch (_) {
      return false;
    }
  }

  Future<bool> sendRecoveryPasswordEmail(String email) async {
    try {
      // await _accountNotifier.accountRemoteRepository
      //     .sendRecoveryPasswordEmail(email: email);
      return true;
    } on CustomDioError catch (_) {
      return false;
    }
  }

  Future<String> certificationCode(String verificationCode) async {
    try {
      final String username = Prefs.instance.getValue(
        ConstantsSharedPrefs.username,
      );
      final String email = Prefs.instance.getValue(ConstantsSharedPrefs.email);
      // await _accountNotifier.accountRemoteRepository.verificationCode(
      //     username: (username.isNotEmpty) ? username : null,
      //     email: (email.isNotEmpty) ? email : null,
      //     verification_code: verificationCode);
      return ErrorsConsts.ok;
    } on CustomDioError catch (e) {
      return e.code.toString();
    }
  }
}
