// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/config/router/router_path.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/widgets/shared/spaced_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SpacedScreen(
      title: S.of(context).Forgot_Password,
      body: const Body(),
      buttonChild: Text(S.of(context).recover_password),
      onPressed: () => context.push(RouterPath.VerificationCodePage),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).Enter_Email,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).enter_email_text,
              textAlign: TextAlign.start,
              softWrap: true,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              label: Text(S.of(context).Email),
            ),
          ),
        ),
      ],
    );
  }
}
