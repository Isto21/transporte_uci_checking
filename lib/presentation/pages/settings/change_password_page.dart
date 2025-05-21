import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/config/helpers/snackbar_gi.dart';
import 'package:transporte_uci_checking/config/helpers/utils.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/change_password_provider.riverpod.dart';
import 'package:transporte_uci_checking/presentation/widgets/shared/spaced_widget.dart';

class ChangePasswordPage extends ConsumerWidget {
  const ChangePasswordPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return SpacedScreen(
      title: S.of(context).Change_Password,
      onPressed: () async {
        final code = await loading(
          context: context,
          action: ref.read(changePasswordProvider.notifier).onSubmit(),
        );
        switch (code) {
          case ErrorsConsts.ok:
            SnackBarGI.showCustom(
              context,
              text: S.of(context).Change_Password_Success,
            );
            ref.invalidate(changePasswordProvider);
            context.pop();
            break;
          case ErrorsConsts.error:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).user_not_found,
            );
            break;
          case ErrorsConsts.invalid_Form:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).invalidForm,
            );
            break;
          default:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: code.isEmpty ? code : S.of(context).errorSended,
            );
        }
      },
      buttonChild: Text(S.of(context).ACCEPT),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged:
                  (value) => ref
                      .read(changePasswordProvider.notifier)
                      .onOldPasswordChange(value),
              obscureText: ref.watch(changePasswordProvider).oldIsObscure,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap:
                      () =>
                          ref
                              .read(changePasswordProvider.notifier)
                              .oldObscureText(),
                  child:
                      (ref.watch(changePasswordProvider).oldIsObscure)
                          ? Icon(Icons.remove_red_eye_rounded)
                          : Icon(Icons.visibility_off_outlined),
                ),
                hintText: S.of(context).Actual_password,
                label: Text(" ${S.of(context).Actual_password}"),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged:
                  (value) => ref
                      .read(changePasswordProvider.notifier)
                      .onNewPasswordChange(value),
              obscureText: ref.watch(changePasswordProvider).isObscure,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap:
                      () =>
                          ref
                              .read(changePasswordProvider.notifier)
                              .obscureText(),
                  child:
                      (ref.watch(changePasswordProvider).isObscure)
                          ? Icon(Icons.remove_red_eye_rounded)
                          : Icon(Icons.visibility_off_outlined),
                ),
                hintText: S.of(context).Enter_New_password,
                label: Text(" ${S.of(context).New_password}"),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged:
                  (value) => ref
                      .read(changePasswordProvider.notifier)
                      .onConfirmNewPasswordChange(value),
              obscureText: ref.watch(changePasswordProvider).confirmIsObscure,
              decoration: InputDecoration(
                errorText: ref
                    .watch(changePasswordProvider.notifier)
                    .matchPassword(context),
                hintText: S.of(context).Enter_New_password,
                suffixIcon: GestureDetector(
                  onTap:
                      () =>
                          ref
                              .read(changePasswordProvider.notifier)
                              .confirmObscureText(),
                  child:
                      (ref.watch(changePasswordProvider).confirmIsObscure)
                          ? Icon(Icons.remove_red_eye_rounded)
                          : Icon(Icons.visibility_off_outlined),
                ),
                label: Text(" ${S.of(context).Confirm_New_password}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
