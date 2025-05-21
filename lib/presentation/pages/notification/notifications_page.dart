import 'package:flutter/material.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/widgets/shared/delete_button.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Notifications,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Title',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(fontSize: 24),
                        ),
                        const Spacer(),
                        Text(
                          'DD/MM/AA',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            'Est sunt ut voluptate proident ut ullamco irure id reprehenderit labore eiusmod. Reprehenderit velit et labore consectetur dolor enim ea incididunt exercitation. Lorem cupidatat occaecat irure sint commodo est ex commodo amet voluptate culpa duis ullamco. Labore irure deserunt ad in.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        DeleteButton(onpressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
