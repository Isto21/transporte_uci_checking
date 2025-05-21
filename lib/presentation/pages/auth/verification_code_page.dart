// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';
import 'package:transporte_uci_checking/config/constants/errors.dart';
import 'package:transporte_uci_checking/config/helpers/snackbar_gi.dart';
import 'package:transporte_uci_checking/config/helpers/utils.dart';
import 'package:transporte_uci_checking/config/router/router_path.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/auth/account_code_verification_provider.riverpod.dart';

class VerificationCodePage extends ConsumerStatefulWidget {
  const VerificationCodePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationCodePageState();
}

class _VerificationCodePageState extends ConsumerState<VerificationCodePage> {
  int counter = 20;
  late Timer timer;

  startTimer() {
    //shows timer
    counter = 60; //time counter

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter > 0 ? counter-- : timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future onSubmit(String value) async {
      final code = await loading(
        context: context,
        action: ref
            .read(verificationCodeProvider.notifier)
            .certificationCode(value),
      );
      if (code != ErrorsConsts.ok) {
        context.pop();
        switch (code) {
          case ErrorsConsts.user_activated:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).user_activated,
            );
            break;
          case ErrorsConsts.user_not_found:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).user_not_found,
            );
            break;
          case ErrorsConsts.incorrect_verification_code:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).incorrect_verification_code,
            );
            break;
          case ErrorsConsts.this_account_is_already_active:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).this_account_is_already_active,
            );
            context.go(RouterPath.LoginPage);
            break;
          default:
            SnackBarGI.showWithIcon(
              context,
              icon: Icons.error_outline,
              text: S.of(context).errorSended,
            );
        }
      } else {
        final loginCode = await loading(
          context: context,
          action: ref.read(verificationCodeProvider.notifier).onSubmit(),
        );
        if (loginCode != ErrorsConsts.ok) {
          context.pop();
          switch (loginCode) {
            case ErrorsConsts.user_not_found:
              SnackBarGI.showWithIcon(
                context,
                icon: Icons.error_outline,
                text: S.of(context).user_not_found,
              );
              break;
            case ErrorsConsts.must_active_the_account:
              SnackBarGI.showWithIcon(
                context,
                icon: Icons.error_outline,
                text: S.of(context).account_not_active,
              );
              context.go(
                RouterPath.VerificationCodePage,
                extra: ApkConstants.isVerificationCode,
              );
              break;
            case ErrorsConsts.language_not_defined:
              SnackBarGI.showWithIcon(
                context,
                icon: Icons.error_outline,
                text: S.of(context).language_not_defined,
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
          ref.read(verificationCodeProvider.notifier).clearPrefs();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Verification_Code,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).Get_Your_Code,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).enter_verification_code_text,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 160,
                child: OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  numberOfFields: 4,
                  fieldWidth: 70,

                  textStyle: const TextStyle(fontSize: 50),
                  borderRadius: BorderRadius.circular(12),
                  borderColor: ApkConstants.primaryApkColor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  fieldHeight: 120,
                  margin: const EdgeInsets.all(0),
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  keyboardType: TextInputType.number,
                  enabledBorderColor: Colors.black26,
                  cursorColor: Colors.black26,
                  focusedBorderColor: ApkConstants.primaryApkColor,
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) async {
                    await onSubmit(verificationCode);
                  }, // end onSubmit
                ),
              ),
              Text(
                counter < 1
                    ? S.of(context).Resend
                    : "${S.of(context).expired_code}: $counter",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.black26),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                child: CustomizedOutlinedButton(
                  title: S.of(context).send_again,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => context.push(RouterPath.ResetPasswordPage),
                  child: Text(S.of(context).verify),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomizedOutlinedButton extends StatelessWidget {
  final String title;
  final Color? color;
  final String? icon;
  final VoidCallback onPressed;
  const CustomizedOutlinedButton({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: color ?? Colors.white,
        shadowColor: ApkConstants.primaryApkColor.withOpacity(0.4),
        elevation: 4,
        side: const BorderSide(
          strokeAlign: 1,
          color: ApkConstants.primaryApkColor,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: const BorderSide(
            strokeAlign: 2,
            color: ApkConstants.primaryApkColor,
            width: 2,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? SvgPicture.asset(icon!) : const SizedBox(),
          if (icon != null) const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ApkConstants.primaryApkColor,
            ),
          ),
        ],
      ),
    );
  }
}
