import 'package:flutter/material.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';

class CustomSearchBottomBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ValueNotifier<double> animation;

  const CustomSearchBottomBar({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Opacity(
        opacity: (1 - animation.value * 0.1),
        child: Transform.scale(
          scaleY: 1 - animation.value * 0.1,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(width: 5),
                  const Icon(Icons.search),
                  const SizedBox(width: 5),
                  Text(S.of(context).Search),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
