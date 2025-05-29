import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';
import 'package:transporte_uci_checking/config/helpers/snackbar_gi.dart';
import 'package:transporte_uci_checking/config/helpers/utils.dart';
import 'package:transporte_uci_checking/config/router/router_path.dart';
import 'package:transporte_uci_checking/domain/entities/user.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/passenger_providers.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/trip_providers.dart';
import 'package:transporte_uci_checking/presentation/views/add_passenger_screen.dart';
import 'package:transporte_uci_checking/presentation/widgets/passenger_search_delegate.dart';

class PassengerListScreen extends ConsumerWidget {
  final int tripId;

  const PassengerListScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passengersAsync = ref.watch(passnegerProvider);
    final added =
        passengersAsync.passengers?.where((test) => test.role == null).toList();
    final selectedPassengers = ref.watch(selectedUserEnitysProvider);
    if (passengersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Mis Viajes')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Lista de pasajeros',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.qr_code,
                          color: ApkConstants.primaryApkColor,
                        ),
                        onPressed: () {
                          context.push(RouterPath.qrScannerPage);
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: ApkConstants.primaryApkColor,
                        ),
                        onPressed: () {
                          // Obtener los pasajeros actuales o usar datos falsos si hay error
                          final List<UserEnity> passengers =
                              passengersAsync.passengers!;

                          // Mostrar el SearchDelegate
                          showSearch(
                            context: context,
                            delegate: PassengerSearchDelegate(
                              passengers: passengers,
                              onPassengerSelected: (passenger) {
                                // Opcional: hacer algo cuando se selecciona un pasajero
                              },
                            ),
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      AddPassengerScreen(tripId: tripId),
                            ),
                          );
                        },

                        icon: const Icon(
                          Icons.add,
                          color: ApkConstants.primaryApkColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    passengersAsync.passengers
                        ?.where((test) => test.role != null)
                        .length,
                itemBuilder: (context, index) {
                  final passenger = passengersAsync.passengers?[index];
                  final isSelected = selectedPassengers.any(
                    (p) => p.name == passenger?.name,
                  );

                  return CheckboxListTile(
                    title: Text(
                      "${passenger?.name ?? ''} ${passenger?.lastName ?? ""}",
                      style: TextStyle(
                        decoration:
                            isSelected ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    value: isSelected,
                    onChanged: (bool? value) {
                      if (value == true) {
                        ref.read(selectedUserEnitysProvider.notifier).state = [
                          ...selectedPassengers,
                          passenger!,
                        ];
                      } else {
                        ref.read(selectedUserEnitysProvider.notifier).state =
                            selectedPassengers
                                .where((p) => p.name != passenger?.name)
                                .toList();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 16),
                Text(
                  "Añadidos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: added?.length ?? 0,
                itemBuilder: (context, index) {
                  final passenger = added?[index];
                  final isSelected = selectedPassengers.any(
                    (p) => p.name == passenger?.name,
                  );

                  return CheckboxListTile(
                    title: Text(
                      "${passenger?.name ?? ''} ${passenger?.lastName ?? ""}",
                      style: TextStyle(
                        decoration:
                            isSelected ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    value: isSelected,
                    onChanged: (bool? value) {
                      if (value == true) {
                        ref.read(selectedUserEnitysProvider.notifier).state = [
                          ...selectedPassengers,
                          passenger!,
                        ];
                      } else {
                        ref.read(selectedUserEnitysProvider.notifier).state =
                            selectedPassengers
                                .where((p) => p.name != passenger?.name)
                                .toList();
                      }
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    await loading(
                      context: context,
                      action: ref
                          .read(tripProvider)
                          .checkIn(
                            tripId.toString(),
                            selectedPassengers
                                .map((toElement) => toElement.id.toString())
                                .toList(),
                          ),
                    );
                    SnackBarGI.showOriginal(
                      context,
                      text: S.of(context).tripClosedSuccessfully,
                    );
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).closeTrip),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
