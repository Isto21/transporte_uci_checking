import 'package:flutter/material.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';

class MainScaffoldWidget extends StatelessWidget {
  const MainScaffoldWidget({
    super.key,
    required this.body,
    this.title,
    this.bottomNavigationBar,
    this.bottomAppBar,
    this.floatingActionButton,
    this.showAppBar = true,
    this.implicityLeading = true,
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomAppBar;
  final Widget? floatingActionButton;
  final Widget? title;
  final bool showAppBar;
  final bool implicityLeading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      backgroundColor: ApkConstants.primaryApkColor,
      appBar:
          showAppBar
              ? AppBar(
                automaticallyImplyLeading: implicityLeading,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1),
                  child: SizedBox(width: double.infinity, child: bottomAppBar),
                ),
                toolbarHeight: MetricsConsts.clipperSize / 1.2,
                title: title,
              )
              : null,
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      extendBody: true,
    );
  }
}
