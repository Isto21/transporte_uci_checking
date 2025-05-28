import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/domain/repositories/inputs/email.dart';
import 'package:transporte_uci_checking/domain/repositories/inputs/password.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/account_provider.riverpod.dart';

final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordStatus>((ref) {
      return ForgotPasswordNotifier(ref.watch(accountProvider.notifier), ref);
    });

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordStatus> {
  final AccountNotifier _accountNotifier;
  final Ref _ref;
  ForgotPasswordNotifier(this._accountNotifier, this._ref)
    : super(ForgotPasswordStatus());

  Future<String> onSubmit({required String firebaseToken}) async {
    try {
      final String username = Prefs.instance.getValue(
        ConstantsSharedPrefs.username,
      );
      final String email = Prefs.instance.getValue(ConstantsSharedPrefs.email);
      await _accountNotifier.login(
        firebaseToken: firebaseToken,
        usernameOrEmail: (username.isNotEmpty) ? username : email,
        password: Prefs.instance.getValue(ConstantsSharedPrefs.password),
      );
      return ErrorsConsts.ok;
    } on CustomDioError catch (e) {
      return e.code.toString();
    }
  }

  Future<void> clearPrefs() async {
    await Prefs.instance.saveValue(ConstantsSharedPrefs.email, '');
    await Prefs.instance.saveValue(ConstantsSharedPrefs.password, '');
    await Prefs.instance.saveValue(ConstantsSharedPrefs.username, '');
  }

  // Future<String> forgotPassword() async {
  //   try {
  //     state = state.copyWith(isValid: state.email.isValid);
  //     final valid = validateEmail();
  //     if (!valid) return ErrorsConsts.invalid_Form;
  //     await _accountNotifier.accountRemoteRepository.forgotPassword(
  //       email: state.email.value,
  //     );
  //     return ErrorsConsts.ok;
  //   } on CustomDioError catch (e) {
  //     return e.code.toString();
  //   }
  // }

  bool validateEmail() {
    return state.email.isValid;
  }

  void onVerificationCodeChange(String value) {
    state = state.copyWith(verificationCode: value);
  }

  void onEmailChange(String value) {
    final email = Email.dirty(value.trim());
    state = state.copyWith(email: email, isValid: validate());
  }

  void onNewPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(newPassword: newPassword, isValid: validate());
  }

  void onConfirmNewPasswordChange(String value) {
    final confirmNewPassword = Password.dirty(value);
    state = state.copyWith(
      confirmNewPassword: confirmNewPassword,
      isValid: validate(),
    );
  }

  void obscureText() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void confirmObscureText() {
    state = state.copyWith(confirmIsObscure: !state.confirmIsObscure);
  }

  String? matchPassword(BuildContext context) {
    if (state.newPassword.value != state.confirmNewPassword.value) {
      return S.of(context).Passwords_Do_Not_Match;
    }
    return null;
  }

  bool validate({
    Email? email,
    Password? newPassword,
    Password? confirmNewPassword,
  }) {
    return Formz.validate([
      email ?? state.email,
      newPassword ?? state.newPassword,
      confirmNewPassword ?? state.confirmNewPassword,
    ]);
  }

  bool matchPasswords() {
    return (state.newPassword.value != state.confirmNewPassword.value);
  }
}

class ForgotPasswordStatus {
  Email email;
  bool isValid;
  String? verificationCode;
  Password newPassword;
  Password confirmNewPassword;
  bool isObscure;
  bool confirmIsObscure;
  ForgotPasswordStatus({
    this.isObscure = true,
    this.confirmIsObscure = true,
    this.newPassword = const Password.pure(),
    this.confirmNewPassword = const Password.pure(),
    this.isValid = false,
    this.email = const Email.pure(),
    this.verificationCode,
  });

  ForgotPasswordStatus copyWith({
    bool? isObscure,
    bool? confirmIsObscure,
    Password? newPassword,
    Password? confirmNewPassword,
    bool? isValid,
    Email? email,
    String? verificationCode,
  }) {
    return ForgotPasswordStatus(
      isObscure: isObscure ?? this.isObscure,
      confirmIsObscure: confirmIsObscure ?? this.confirmIsObscure,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      verificationCode: verificationCode ?? this.verificationCode,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
    );
  }
}
