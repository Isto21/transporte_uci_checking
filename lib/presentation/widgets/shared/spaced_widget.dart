import 'package:flutter/material.dart';

class SpacedScreen extends StatelessWidget {
  final Color? color;
  final Widget body;
  final String? title;
  final String? fotterLetter;
  final VoidCallback onPressed;
  final Widget buttonChild;
  const SpacedScreen({
    super.key,
    required this.onPressed,
    required this.buttonChild,
    required this.body,
    this.color,
    this.title,
    this.fotterLetter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
        child: FilledButton(
          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
          onPressed: () => onPressed(),
          child: buttonChild,
        ),
      ),
      appBar: AppBar(
        title: Text(
          title?.toUpperCase() ?? '',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            body,
            Column(
              children: [
                (fotterLetter != null)
                    ? Text(
                      fotterLetter!,
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                    : const SizedBox(),
                const SizedBox(height: 20),

                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
