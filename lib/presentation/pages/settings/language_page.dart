import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/language/locale_provider.dart';
import 'package:transporte_uci_checking/presentation/providers/theme/is_dark_theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final language = ref.watch(localeProvider);
    final theme = ref.watch(isDarkThemeProvider);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 26),
        child: FilledButton(
          onPressed: () => context.pop(),
          child: Text(S.of(context).Continue),
        ),
      ),
      appBar: AppBar(title: Text(S.of(context).setting)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 8.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text(
                S.of(context).LANGUAGE,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            RadioListTile.adaptive(
              value: const Locale('en'),
              groupValue: language.locale,
              title: Text(
                S.of(context).English,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onChanged: (value) {
                ref.read(localeProvider.notifier).setLocale('en');
              },
            ),
            RadioListTile.adaptive(
              value: const Locale('es'),
              groupValue: language.locale,
              title: Text(
                S.of(context).Spanish,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onChanged: (value) {
                ref.read(localeProvider.notifier).setLocale('es');
              },
            ),
            // RadioListTile.adaptive(
            //     groupValue: language.locale,
            //     value: const Locale('pt'),
            //     title: Text(S.of(context).Portuguese,
            //         style: Theme.of(context).textTheme.bodyMedium),
            //     onChanged: (value) {
            //       ref.read(localeProvider.notifier).setLocale('pt');
            //     }),
            ListTile(
              leading: Icon(Icons.auto_mode),
              title: Text(
                S.of(context).LANGUAGE,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            RadioListTile.adaptive(
              value: false,
              groupValue: theme,
              title: Text(
                S.of(context).Light_Mode,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onChanged: (value) {
                ref.read(isDarkThemeProvider.notifier).state = value!;
              },
            ),
            RadioListTile.adaptive(
              value: true,
              groupValue: theme,
              title: Text(
                S.of(context).Dark_Mode,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onChanged: (value) {
                ref.read(isDarkThemeProvider.notifier).state = value!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
