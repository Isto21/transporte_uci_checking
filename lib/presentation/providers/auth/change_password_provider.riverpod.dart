// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/repositories/inputs/email.dart';
import 'package:transporte_uci_checking/domain/repositories/inputs/password.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/account_provider.riverpod.dart';

final changePasswordProvider =
    StateNotifierProvider<ChangePasswordNotifier, ChangePasswordStatus>((ref) {
      return ChangePasswordNotifier(ref.watch(accountProvider.notifier));
    });

class ChangePasswordNotifier extends StateNotifier<ChangePasswordStatus> {
  final AccountNotifier _accountNotifier;
  ChangePasswordNotifier(this._accountNotifier) : super(ChangePasswordStatus());

  Future<String> onSubmit() async {
    try {
      await _accountNotifier.changePassword(
        oldPassword: state.oldPassword.value,
        newPassword: state.newPassword.value,
      );
      return ErrorsConsts.ok;
    } on CustomDioError catch (e) {
      return e.code.toString();
    }
  }

  void onNewPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(newPassword: newPassword, isValid: validate());
  }

  void onOldPasswordChange(String value) {
    final oldPassword = Password.dirty(value);
    state = state.copyWith(oldPassword: oldPassword, isValid: validate());
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

  void oldObscureText() {
    state = state.copyWith(oldIsObscure: !state.oldIsObscure);
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
    Password? oldPassword,
    Password? confirmNewPassword,
  }) {
    return Formz.validate([
      newPassword ?? state.newPassword,
      oldPassword ?? state.oldPassword,
      confirmNewPassword ?? state.confirmNewPassword,
    ]);
  }
}

class ChangePasswordStatus {
  bool isValid;
  Password newPassword;
  Password oldPassword;
  Password confirmNewPassword;
  bool isObscure;
  bool oldIsObscure;
  bool confirmIsObscure;
  ChangePasswordStatus({
    this.isObscure = true,
    this.confirmIsObscure = true,
    this.oldIsObscure = true,
    this.newPassword = const Password.pure(),
    this.oldPassword = const Password.pure(),
    this.confirmNewPassword = const Password.pure(),
    this.isValid = false,
  });

  ChangePasswordStatus copyWith({
    bool? isValid,
    Password? newPassword,
    Password? oldPassword,
    Password? confirmNewPassword,
    bool? isObscure,
    bool? oldIsObscure,
    bool? confirmIsObscure,
  }) {
    return ChangePasswordStatus(
      isValid: isValid ?? this.isValid,
      newPassword: newPassword ?? this.newPassword,
      oldPassword: oldPassword ?? this.oldPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      isObscure: isObscure ?? this.isObscure,
      oldIsObscure: oldIsObscure ?? this.oldIsObscure,
      confirmIsObscure: confirmIsObscure ?? this.confirmIsObscure,
    );
  }
}
