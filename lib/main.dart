import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/config/router/router.dart';
import 'package:transporte_uci_checking/config/theme/app_theme.dart';
import 'package:transporte_uci_checking/data/database/database.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/l10n/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Isar
  final isarService = IsarService();
  await isarService.openDB();

  // Inicializar SharedPreferences
  await Prefs.instance.initPrefs();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final locale = ref.watch(localeProvider);
        final brightness = ref.watch(isDarkThemeProvider);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().themeLight(),
          darkTheme: AppTheme().themeDark(),
          themeMode:
              (brightness)
                  ? ThemeMode.dark
                  : (!brightness)
                  ? ThemeMode.light
                  : ThemeMode.system,
          routerConfig: ref.read(routerProvider),

          //para el idioma
          locale: locale.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}
