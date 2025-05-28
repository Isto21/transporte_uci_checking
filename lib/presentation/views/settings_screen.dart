import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';
import 'package:transporte_uci_checking/config/helpers/utils.dart';
import 'package:transporte_uci_checking/config/router/router_path.dart';
import 'package:transporte_uci_checking/data/shared_preferences/constants_shared_prefs.dart';
import 'package:transporte_uci_checking/data/shared_preferences/shared_prefs.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/widgets/shared/custom_alert_dialog.shared.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).setting)),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _buildSettingSection(S.of(context).my_profile, [
            // _buildSettingItem(
            //   context,
            //   'Información personal',
            //   Icons.person,
            //   () {},
            // ),
            _buildSettingItem(
              context,
              S.of(context).Change_Password,
              Icons.lock,
              () => context.push(RouterPath.changePassword),
            ),
          ]),
          _buildSettingSection(S.of(context).preferences, [
            _buildSettingItem(
              context,
              S.of(context).settings,
              Icons.color_lens,
              () => context.push(RouterPath.settings),
            ),
          ]),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FilledButton(
              onPressed: () async {
                await showTransitionDialogue(
                  CustomAlertDialog(
                    title: S.of(context).Sign_Off,
                    content: const Text(
                      '¿Usted está seguro que desea salir de la aplicación?',
                      style: TextStyle(fontSize: 16),
                    ),
                    funcionAccept: () {
                      context.go(RouterPath.LoginPage);
                      Prefs.instance.saveValue(
                        ConstantsSharedPrefs.mark,
                        ApkConstants.isNotLogged,
                      );
                      Prefs.instance.saveValue(
                        ConstantsSharedPrefs.accessToken,
                        '',
                      );
                    },
                  ),
                  context,
                );
              },
              child: Text(S.of(context).Sign_Off),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSettingSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ApkConstants.primaryApkColor,
            ),
          ),
        ),
        ...items,
        const Divider(),
      ],
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: ApkConstants.primaryApkColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
