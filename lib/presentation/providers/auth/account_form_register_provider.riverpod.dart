// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:transporte_uci_checking/domain/repositories/inputs/inputs_exports.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';
import 'package:transporte_uci_checking/presentation/providers/data/api_provider.riverpod.dart';

final registerFromAccountProvider =
    StateNotifierProvider<AccountregisterFormNotifier, RegisterStatus>((ref) {
      return AccountregisterFormNotifier(ref.watch(apiProvider).auth);
    });

class AccountregisterFormNotifier extends StateNotifier<RegisterStatus> {
  final AuthRemoteRepository _authRemoteRepository;
  AccountregisterFormNotifier(this._authRemoteRepository)
    : super(RegisterStatus());

  void onMotherNameChange(String value) {
    final motherName = Name.dirty(value.trim());
    state = state.copyWith(motherName: motherName, isValid: validate());
  }

  void onFatherNameChange(String value) {
    final fatherName = Name.dirty(value.trim());
    state = state.copyWith(fatherName: fatherName, isValid: validate());
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(password: password, isValid: validate());
  }

  void onPhoneChange(String value) {
    final phone = Phone.dirty(value.trim());
    state = state.copyWith(phone: phone, isValid: validate());
  }

  void onNameChange(String value) {
    final name = Name.dirty(value.trim());
    state = state.copyWith(name: name, isValid: validate());
  }

  void obscureText() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  void closeValidation() =>
      state = state.copyWith(
        userName: Username.dirty(state.userName.value),
        name: Name.dirty(state.name.value),
        motherName: Name.dirty(state.motherName.value),
        fatherName: Name.dirty(state.fatherName.value),
        email: Email.dirty(state.email.value),
        phone: Phone.dirty(state.phone.value),
        password: Password.dirty(state.password.value),
        isValid: validate(),
      );

  bool validate({
    Username? userName,
    Name? name,
    Name? motherName,
    Name? fatherName,
    Email? email,
    Phone? phone,
    Password? password,
  }) {
    final formValidation = Formz.validate([
      userName ?? state.userName,
      name ?? state.name,
      motherName ?? state.motherName,
      fatherName ?? state.fatherName,
      email ?? state.email,
      phone ?? state.phone,
      password ?? state.password,
    ]);
    return formValidation && state.usernameIsValid && state.emailIsValid;
  }
}

class RegisterStatus {
  bool isValid;
  bool usernameIsValid;
  bool usernameIsValidating;
  bool emailIsValid;
  bool emailIsValidating;
  Name name;
  Name fatherName;
  Name motherName;
  Email email;
  Phone phone;
  Username userName;
  Password password;
  bool isObscure;
  RegisterStatus({
    this.usernameIsValid = true,
    this.emailIsValid = true,
    this.usernameIsValidating = false,
    this.emailIsValidating = false,
    this.isValid = false,
    this.isObscure = false,
    this.fatherName = const Name.pure(),
    this.motherName = const Name.pure(),
    this.userName = const Username.pure(),
    this.password = const Password.pure(),
    this.phone = const Phone.pure(),
    this.email = const Email.pure(),
    this.name = const Name.pure(),
  });

  RegisterStatus copyWith({
    bool? isValid,
    bool? usernameIsValid,
    bool? usernameIsValidating,
    bool? emailIsValid,
    bool? emailIsValidating,
    Name? name,
    Name? fatherName,
    Name? motherName,
    Email? email,
    Phone? phone,
    Username? userName,
    Password? password,
    bool? isObscure,
  }) {
    return RegisterStatus(
      isValid: isValid ?? this.isValid,
      usernameIsValid: usernameIsValid ?? this.usernameIsValid,
      usernameIsValidating: usernameIsValidating ?? this.usernameIsValidating,
      emailIsValid: emailIsValid ?? this.emailIsValid,
      emailIsValidating: emailIsValidating ?? this.emailIsValidating,
      name: name ?? this.name,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
