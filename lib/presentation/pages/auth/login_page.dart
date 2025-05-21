import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/config/helpers/snackbar_gi.dart';
import 'package:transporte_uci_checking/config/helpers/utils.dart';
import 'package:transporte_uci_checking/config/router/router_path.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/account_code_verification_provider.riverpod.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/account_form_login_provider.riverpod.dart';

class LoginPage extends HookConsumerWidget {
  final Debounce _emailDebounce = Debounce(milliseconds: 800);
  LoginPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final loginProvider = ref.watch(loginFromAccountProvider);
    final rememberCheck = useState(
      (Prefs.instance.getValue(ConstantsSharedPrefs.password) != '')
          ? true
          : false,
    );
    Future<void> onSubmit() async {
      final String code = await loading(
        context: context,
        action: ref
            .read(loginFromAccountProvider.notifier)
            .onSubmit(firebaseToken: ''),
      );
      if (code != ErrorsConsts.ok) {
        switch (code) {
          case ErrorsConsts.expired_token:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).wrongCredentials,
            );
            break;
          case ErrorsConsts.invalid_Form:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).invalidForm,
            );
            break;
          case ErrorsConsts.must_active_the_account:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).must_active_the_account,
            );
            break;
          case ErrorsConsts.not_found:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).user_not_found,
            );
            break;
          default:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: code.isEmpty ? code : S.of(context).errorSended,
            );
        }
      } else {
        context.go(RouterPath.HomePage);
        Prefs.instance.saveValue(
          ConstantsSharedPrefs.mark,
          ApkConstants.isLogged,
        );
        if (rememberCheck.value) {
          Prefs.instance.saveValue(
            ConstantsSharedPrefs.email,
            loginProvider.usernameOrEmail.value,
          );
          Prefs.instance.saveValue(
            ConstantsSharedPrefs.password,
            loginProvider.password.value,
          );
          // Prefs.instance.saveValue(ConstantsSharedPrefs.isGoogleAuth, false);
        } else {
          ref.read(verificationCodeProvider.notifier).clearPrefs();
        }
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).login,
                      style: Theme.of(context).textTheme.displayMedium!,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      S.of(context).loginText,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue:
                              (Prefs.instance.getValue(
                                    ConstantsSharedPrefs.email,
                                  ) ??
                                  loginProvider.usernameOrEmail.value),
                          onChanged:
                              (value) => _emailDebounce.run(
                                () => ref
                                    .read(loginFromAccountProvider.notifier)
                                    .onUsernameOrEmailChange(value),
                              ),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            errorText: loginProvider.usernameOrEmail
                                .getErrorMessage(context),
                            label: Text("  ${S.of(context).Email}"),
                          ),
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          initialValue:
                              (Prefs.instance.getValue(
                                    ConstantsSharedPrefs.password,
                                  ) ??
                                  loginProvider.password.value),
                          obscureText:
                              ref.watch(loginFromAccountProvider).isObscure,
                          onChanged:
                              (value) => ref
                                  .read(loginFromAccountProvider.notifier)
                                  .onPasswordChange(value),
                          decoration: InputDecoration(
                            errorText: loginProvider.password.getErrorMessage(
                              context,
                            ),
                            suffixIcon: IconButton(
                              onPressed:
                                  () =>
                                      ref
                                          .read(
                                            loginFromAccountProvider.notifier,
                                          )
                                          .obscureText(),
                              icon:
                                  (ref
                                          .watch(loginFromAccountProvider)
                                          .isObscure)
                                      ? const Icon(Icons.remove_red_eye)
                                      : const Icon(Icons.visibility_off),
                            ),
                            label: Text(S.of(context).Password),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed:
                                  () => context.push(
                                    RouterPath.ForgotPasswordPage,
                                  ),
                              child: Text(
                                S.of(context).Forgot_Password,
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        CheckboxListTile(
                          dense: true,
                          selected: true,
                          contentPadding: const EdgeInsets.all(0),
                          checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: rememberCheck.value,
                          onChanged: (value) => rememberCheck.value = value!,
                          title: Text(
                            S.of(context).rememberMe,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FilledButton(
                          onPressed: () async => await onSubmit(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 70,
                              vertical: 4,
                            ),
                            child: Text(S.of(context).login),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Stack(
                        //   alignment: const Alignment(0, 0),
                        //   children: [
                        //     Divider(color: Colors.grey[300], height: 5, thickness: 2),
                        //     Container(
                        //       padding: const EdgeInsets.symmetric(horizontal: 12),
                        //       color: Theme.of(context).scaffoldBackgroundColor,
                        //       child: Text(
                        //         S.of(context).or,
                        //         style: Theme.of(
                        //           context,
                        //         ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 20),

                        // const SizedBox(height: 20),
                        // RichText(
                        //   text: TextSpan(
                        //     children: [
                        //       TextSpan(
                        //         text: S.of(context).Dont_account,
                        //         style: Theme.of(
                        //           context,
                        //         ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                        //       ),
                        //       // TextSpan(
                        //       //     recognizer: TapGestureRecognizer()
                        //       //       ..onTap = () => context.go(RouterPath.SingUpPage),
                        //       //     text: S.of(context).Sign_Up,
                        //       //     style: Theme.of(context)
                        //       //         .textTheme
                        //       //         .bodyMedium!
                        //       //         .copyWith(color: ApkConstants.primaryApkColor)),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: FilledButton(
                        //     style: ButtonStyle(
                        //       backgroundColor: WidgetStateProperty.all(Colors.black),
                        //     ),
                        //     onPressed: () => context.go(RouterPath.SingUpPage),
                        //     child: Text(S.of(context).create_account),
                        //   ),
                        // ),
                        // const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
