// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/domain/repositories/inputs/email.dart';
import 'package:transporte_uci_checking/domain/repositories/inputs/password.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/account_provider.riverpod.dart';

final loginFromAccountProvider =
    StateNotifierProvider<AccountLoginFormNotifier, LoginStatus>((ref) {
      return AccountLoginFormNotifier(ref.read(accountProvider.notifier));
    });

class AccountLoginFormNotifier extends StateNotifier<LoginStatus> {
  final AccountNotifier _accountNotifier;
  AccountLoginFormNotifier(this._accountNotifier) : super(LoginStatus());

  Future<String> onSubmit({required String? firebaseToken}) async {
    try {
      state = state.copyWith(
        usernameOrEmail: state.usernameOrEmail,
        password: state.password,
        isValid: validate(),
      );

      if (!state.isValid) {
        state = state.copyWith(isValid: false);
        return ErrorsConsts.invalid_Form;
      }
      await _accountNotifier.login(
        usernameOrEmail: state.usernameOrEmail.value,
        password: state.password.value,
        firebaseToken: firebaseToken,
      );
      state = state.copyWith(
        usernameOrEmail: const Email.pure(),
        password: const Password.pure(),
      );
      return ErrorsConsts.ok;
    } on CustomDioError catch (e) {
      state = state.copyWith(isValid: false);

      if (e.code.toString() == ErrorsConsts.must_active_the_account) {
        if (state.usernameOrEmail.value.contains("@")) {
          Prefs.instance.saveValue(
            ConstantsSharedPrefs.email,
            state.usernameOrEmail.value,
          );
          Prefs.instance.saveValue(ConstantsSharedPrefs.username, "");
        } else {
          Prefs.instance.saveValue(
            ConstantsSharedPrefs.username,
            state.usernameOrEmail.value,
          );
          Prefs.instance.saveValue(ConstantsSharedPrefs.email, '');
        }
      }
      return e.code.toString();
    }
  }

  void onUsernameOrEmailChange(String value) {
    final usernameOrEmail = Email.dirty(value.trim());
    state = state.copyWith(
      usernameOrEmail: usernameOrEmail,
      isValid: validate(),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value.trim());
    state = state.copyWith(password: password, isValid: validate());
  }

  void obscureText() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  bool validate({Email? usernameOrEmail, Password? password, Email? email}) =>
      Formz.validate([
        usernameOrEmail ?? state.usernameOrEmail,
        password ?? state.password,
      ]);
}

class LoginStatus {
  bool isValid;
  Email usernameOrEmail;
  Password password;
  bool isObscure;
  LoginStatus({
    this.isValid = false,
    this.isObscure = true,
    this.usernameOrEmail = const Email.pure(),
    this.password = const Password.pure(),
  });

  LoginStatus copyWith({
    bool? isValid,
    Email? usernameOrEmail,
    Password? password,
    bool? isObscure,
    String? firebaseToken,
  }) {
    return LoginStatus(
      isValid: isValid ?? this.isValid,
      usernameOrEmail: usernameOrEmail ?? this.usernameOrEmail,
      password: password ?? this.password,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
