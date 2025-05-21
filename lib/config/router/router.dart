import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/presentation/pages/auth/reset_password_page.dart';
import 'package:transporte_uci_checking/presentation/pages/auth/sign_up_page.dart';
import 'package:transporte_uci_checking/presentation/pages/auth/verification_code_page.dart';
import 'package:transporte_uci_checking/presentation/pages/pages.dart';
import 'package:transporte_uci_checking/presentation/pages/settings/change_password_page.dart';
import 'package:transporte_uci_checking/presentation/pages/settings/language_page.dart';

import 'router_path.dart';
import 'router_transition.dart';

final routerProvider = StateProvider<GoRouter>((ref) {
  final refresh = Prefs.instance.getValue(ConstantsSharedPrefs.mark);
  return GoRouter(
    initialLocation:
        (refresh.toString().isEmpty || refresh == null)
            ? RouterPath.LoginPage
            : RouterPath.HomePage,
    routes: [
      GoRoute(
        path: RouterPath.HomePage,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: HomePage(),
            ),
      ),
      GoRoute(
        path: RouterPath.LoginPage,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: LoginPage(),
            ),
      ),

      GoRoute(
        path: RouterPath.ForgotPasswordPage,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: const ForgotPasswordPage(),
            ),
      ),
      GoRoute(
        path: RouterPath.ResetPasswordPage,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: const ResetPasswordPage(),
            ),
      ),

      GoRoute(
        path: RouterPath.VerificationCodePage,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: const VerificationCodePage(),
            ),
      ),
      GoRoute(
        path: RouterPath.changePassword,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: const ChangePasswordPage(),
            ),
      ),
      GoRoute(
        path: RouterPath.settings,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: const SettingsPage(),
            ),
      ),
      GoRoute(
        path: RouterPath.SingUpPage,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: const SingUpPage(),
            ),
      ),
      GoRoute(
        path: RouterPath.NotificationsPage,
        pageBuilder:
            (context, state) => RouterTransition.fadeTransitionPage(
              key: state.pageKey,
              child: const NotificationsPage(),
            ),
      ),
    ],
  );
});
