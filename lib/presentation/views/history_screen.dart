import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/trip_providers.dart';
import 'package:transporte_uci_checking/presentation/widgets/expandable_trip_card.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historicalTripsAsync = ref.watch(historicalTripsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Historial')),
      body: historicalTripsAsync.when(
        data: (trips) {
          // Agrupar viajes por fecha
          final Map<String, List<Trip>> tripsByDate = {};
          for (final trip in trips) {
            if (!tripsByDate.containsKey(trip.date)) {
              tripsByDate[trip.date] = [];
            }
            tripsByDate[trip.date]!.add(trip);
          }

          // Convertir el mapa a una lista plana para el ListView
          final List<Widget> listItems = [];

          tripsByDate.forEach((date, dateTrips) {
            // Añadir el encabezado de fecha
            listItems.add(
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 8.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );

            // Añadir los viajes de esta fecha con ExpansionTile
            for (final trip in dateTrips) {
              listItems.add(
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: ExpandableTripCard(trip: trip),
                ),
              );
            }
          });

          return ListView(children: listItems);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          // Datos falsos para mostrar en caso de error
          final List<Trip> fakeTrips = [
            Trip(
              id: 101,
              date: '15/05/25',
              departureTime: '8:00',
              returnTime: '14:00',
            ),
            Trip(
              id: 102,
              date: '15/05/25',
              departureTime: '10:30',
              returnTime: '16:30',
            ),
            Trip(
              id: 103,
              date: '14/05/25',
              departureTime: '9:15',
              returnTime: '15:15',
            ),
            Trip(
              id: 104,
              date: '14/05/25',
              departureTime: '14:00',
              returnTime: '20:00',
            ),
            Trip(
              id: 105,
              date: '13/05/25',
              departureTime: '8:00',
              returnTime: '14:00',
            ),
          ];

          // Agrupar viajes por fecha
          final Map<String, List<Trip>> tripsByDate = {};
          for (final trip in fakeTrips) {
            if (!tripsByDate.containsKey(trip.date)) {
              tripsByDate[trip.date] = [];
            }
            tripsByDate[trip.date]!.add(trip);
          }

          // Convertir el mapa a una lista plana para el ListView
          final List<Widget> listItems = [];

          tripsByDate.forEach((date, dateTrips) {
            // Añadir el encabezado de fecha
            listItems.add(
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 8.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );

            // Añadir los viajes de esta fecha con ExpansionTile
            for (final trip in dateTrips) {
              listItems.add(
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: ExpandableTripCard(trip: trip),
                ),
              );
            }
          });

          return ListView(children: listItems);
        },
      ),
    );
  }
}
