import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transporte_uci_checking/config/router/router_path.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';

class SingUpPage extends HookConsumerWidget {
  const SingUpPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final firstPassword = useState(true);
    final secondPassword = useState(true);
    final confirmPassword = useState('');
    // Future<void> onSubmit() async {
    //   final code = await loading(
    //       context: context,
    //       action: ref.read(registerFromAccountProvider.notifier).onSubmit());
    //   if (code != ErrorsConsts.created_account) {
    //     switch (code) {
    //       case ErrorsConsts.username_already_exists:
    //         SnackBarGI.showWithIcon(context,
    //             icon: Icons.error_outline,
    //             text: S.of(context).username_already_exists);
    //         break;
    //       case ErrorsConsts.email_already_exists:
    //         SnackBarGI.showWithIcon(context,
    //             icon: Icons.error_outline,
    //             text: S.of(context).email_already_exists);
    //         break;
    //       case ErrorsConsts.phone_already_exists:
    //         SnackBarGI.showWithIcon(context,
    //             icon: Icons.error_outline,
    //             text: S.of(context).phone_already_exists);
    //         break;
    //       case ErrorsConsts.error_creating_account:
    //         SnackBarGI.showWithIcon(context,
    //             icon: Icons.error_outline,
    //             text: S.of(context).error_creating_account);
    //         break;
    //       case ErrorsConsts.language_not_defined:
    //         SnackBarGI.showWithIcon(context,
    //             icon: Icons.error_outline,
    //             text: S.of(context).language_not_defined);
    //         break;
    //       default:
    //         SnackBarGI.showWithIcon(context,
    //             icon: Icons.error_outline,
    //             text: code.isEmpty ? code : S.of(context).errorSended);
    //     }
    //     context.pop();
    //   } else {
    //     context.go(
    //       RouterPath.VerificationCodePage,
    //     );
    //     context.pop();
    //   }
    // }

    // final registerProvider = ref.watch(registerFromAccountProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 120),
              Text(
                S.of(context).Sign_Up,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).Sign_Up_Text,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  const SizedBox(height: 12),
                  TextFormField(
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 20),
                    // onChanged: (value) => ref
                    //     .read(registerFromAccountProvider.notifier)
                    //     .onNameChange(value),
                    decoration: InputDecoration(
                      // errorText: registerProvider.name.getErrorMessage(context),
                      prefixIcon: const Icon(Icons.person),
                      labelText: S.of(context).name_and_last_name,
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 20),
                    // onChanged: (value) => ref
                    //     .read(registerFromAccountProvider.notifier)
                    //     .onEmailChange(value),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      labelText: S.of(context).Email,
                      // errorText: registerProvider.email.getErrorMessage(context),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 20),
                    obscureText: firstPassword.value,
                    // onChanged: (value) => ref
                    //     .read(registerFromAccountProvider.notifier)
                    //     .onPasswordChange(value),
                    decoration: InputDecoration(
                      // errorText:
                      // registerProvider.password.getErrorMessage(context),
                      suffixIcon: GestureDetector(
                        onTap: () => firstPassword.value = !firstPassword.value,
                        child: Icon(
                          (firstPassword.value)
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      labelText: S.of(context).Password,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CheckboxListTile(
                    selected: true,
                    checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    // value: ref.watch(registerFromAccountProvider).termsAccepted,
                    value: false,
                    onChanged: (v) {},
                    // onChanged: (value) => ref
                    //     .read(registerFromAccountProvider.notifier)
                    //     .onTermsAcceptedChange(value!),
                    title: Text(
                      S.of(context).termsAndConditions,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        // await onSubmit();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 4,
                        ),
                        child: Text(S.of(context).Sign_Up),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: const Alignment(0, 0),
                    children: [
                      Divider(color: Colors.grey[300], height: 5, thickness: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Text(
                          S.of(context).orSignUp,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  const SizedBox(height: 40),
                  // RichText(
                  //     text: TextSpan(children: [
                  //   TextSpan(
                  //       text: S.of(context).Already_account,
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .bodyMedium!
                  //           .copyWith(color: Colors.grey)),
                  //   TextSpan(
                  //       recognizer: TapGestureRecognizer()
                  //         ..onTap = () => context.go(RouterPath.LoginPage),
                  //       text: S.of(context).sign_in,
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .bodyMedium!
                  //           .copyWith(color: ApkConstants.primaryApkColor)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).Already_account,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () => context.go(RouterPath.LoginPage),
                        child: Text(
                          S.of(context).sign_in,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
