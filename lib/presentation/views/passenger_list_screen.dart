import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/config/helpers/snackbar_gi.dart';
import 'package:transporte_uci_checking/config/helpers/utils.dart';
import 'package:transporte_uci_checking/data/datasources/models/passenger.module.dart';
import 'package:transporte_uci_checking/generated/l10n.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/passenger_providers.dart';
import 'package:transporte_uci_checking/presentation/views/add_passenger_screen.dart';
import 'package:transporte_uci_checking/presentation/widgets/passenger_search_delegate.dart';

final List<Passenger> fakePassengers = [
  Passenger(name: 'Fabian Rosales'),
  Passenger(name: 'Alexis Garcia'),
  Passenger(name: 'Fidel Legra'),
  Passenger(name: 'Luis Tomas Lezcano'),
  Passenger(name: 'Alexander Abreu'),
  Passenger(name: 'Juan Dominguez'),
  Passenger(name: 'Eleanor Pena'),
  Passenger(name: 'Kristin Watson'),
  Passenger(name: 'Courtney Henry'),
  Passenger(name: 'Leslie Alexander'),
  Passenger(name: 'Jenny Wilson'),
  Passenger(name: 'Guy Hawkins'),
  Passenger(name: 'Albert Flores'),
  Passenger(name: 'Kathryn Murphy'),
  Passenger(name: 'Brooklyn Simmons'),
  Passenger(name: 'Jerome Bell'),
  Passenger(name: 'Dianne Russell'),
  Passenger(name: 'Cameron Williamson'),
  Passenger(name: 'Jacob Jones'),
  Passenger(name: 'Esther Howard'),
  Passenger(name: 'Ralph Edwards'),
  Passenger(name: 'Arlene McCoy'),
  Passenger(name: 'Savannah Nguyen'),
  Passenger(name: 'Darrell Steward'),
  Passenger(name: 'Bessie Cooper'),
  Passenger(name: 'Wade Warren'),
  Passenger(name: 'Floyd Miles'),
  Passenger(name: 'Theresa Webb'),
  Passenger(name: 'Robert Fox'),
];

class PassengerListScreen extends ConsumerWidget {
  final int tripId;

  const PassengerListScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passengersAsync = ref.watch(passengersProvider(tripId));
    final selectedPassengers = ref.watch(selectedPassengersProvider);

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
                      icon: const Icon(Icons.qr_code, color: Colors.blue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.blue),
                      onPressed: () {
                        // Obtener los pasajeros actuales o usar datos falsos si hay error
                        final List<Passenger> passengers = passengersAsync.when(
                          data: (data) => data,
                          loading: () => [],
                          error: (_, __) => fakePassengers,
                        );

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
                                (context) => AddPassengerScreen(tripId: tripId),
                          ),
                        );
                      },

                      icon: const Icon(Icons.add, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: passengersAsync.when(
              data: (passengers) {
                return ListView.builder(
                  itemCount: passengers.length,
                  itemBuilder: (context, index) {
                    final passenger = passengers[index];
                    final isSelected = selectedPassengers.any(
                      (p) => p.name == passenger.name,
                    );

                    return CheckboxListTile(
                      title: Text(passenger.name),
                      value: isSelected,
                      onChanged: (bool? value) {
                        if (value == true) {
                          ref
                              .read(selectedPassengersProvider.notifier)
                              .state = [...selectedPassengers, passenger];
                        } else {
                          ref.read(selectedPassengersProvider.notifier).state =
                              selectedPassengers
                                  .where((p) => p.name != passenger.name)
                                  .toList();
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) {
                // Datos falsos para mostrar en caso de error

                return ListView.builder(
                  itemCount: fakePassengers.length,
                  itemBuilder: (context, index) {
                    final passenger = fakePassengers[index];
                    final isSelected = selectedPassengers.any(
                      (p) => p.name == passenger.name,
                    );

                    return CheckboxListTile(
                      title: Text(passenger.name),
                      value: isSelected,
                      onChanged: (bool? value) {
                        if (value == true) {
                          ref
                              .read(selectedPassengersProvider.notifier)
                              .state = [...selectedPassengers, passenger];
                        } else {
                          ref.read(selectedPassengersProvider.notifier).state =
                              selectedPassengers
                                  .where((p) => p.name != passenger.name)
                                  .toList();
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  loading(
                    context: context,
                    action: Future.delayed(const Duration(seconds: 3), () {
                      SnackBarGI.showOriginal(
                        context,
                        text: S.of(context).tripClosedSuccessfully,
                      );
                      Navigator.pop(context);
                    }),
                  );
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
