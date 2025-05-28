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

final List<UserEnity> fakePassengers = [
  UserEnity(name: 'Fabian Rosales'),
  UserEnity(name: 'Alexis Garcia'),
  UserEnity(name: 'Fidel Legra'),
  UserEnity(name: 'Luis Tomas Lezcano'),
  UserEnity(name: 'Alexander Abreu'),
  UserEnity(name: 'Juan Dominguez'),
  UserEnity(name: 'Eleanor Pena'),
  UserEnity(name: 'Kristin Watson'),
  UserEnity(name: 'Courtney Henry'),
  UserEnity(name: 'Leslie Alexander'),
  UserEnity(name: 'Jenny Wilson'),
  UserEnity(name: 'Guy Hawkins'),
  UserEnity(name: 'Albert Flores'),
  UserEnity(name: 'Kathryn Murphy'),
  UserEnity(name: 'Brooklyn Simmons'),
  UserEnity(name: 'Jerome Bell'),
  UserEnity(name: 'Dianne Russell'),
  UserEnity(name: 'Cameron Williamson'),
  UserEnity(name: 'Jacob Jones'),
  UserEnity(name: 'Esther Howard'),
  UserEnity(name: 'Ralph Edwards'),
  UserEnity(name: 'Arlene McCoy'),
  UserEnity(name: 'Savannah Nguyen'),
  UserEnity(name: 'Darrell Steward'),
  UserEnity(name: 'Bessie Cooper'),
  UserEnity(name: 'Wade Warren'),
  UserEnity(name: 'Floyd Miles'),
  UserEnity(name: 'Theresa Webb'),
  UserEnity(name: 'Robert Fox'),
];

class PassengerListScreen extends ConsumerWidget {
  final int tripId;

  const PassengerListScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passengersAsync = ref.watch(passnegerProvider);
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
                itemCount: passengersAsync.passengers?.length,
                itemBuilder: (context, index) {
                  final passenger = passengersAsync.passengers?[index];
                  final isSelected = selectedPassengers.any(
                    (p) => p.name == passenger?.name,
                  );

                  return CheckboxListTile(
                    title: Text(passenger?.name ?? ''),
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
