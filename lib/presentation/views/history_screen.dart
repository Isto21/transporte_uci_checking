import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/trip_providers.dart';
import 'package:transporte_uci_checking/presentation/widgets/expandable_trip_card.dart';
import 'package:transporte_uci_checking/presentation/widgets/shared/standard_error_page.dart';

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
          final Map<String, List<TripEntity>> tripsByDate = {};
          for (final trip in trips) {
            if (!tripsByDate.containsKey(trip.date)) {
              tripsByDate[trip.date!] = [];
            }
            tripsByDate[trip.date]!.add(trip);
          }
          tripsByDate.entries.toList().sort((a, b) => a.key.compareTo(b.key));
          tripsByDate.removeWhere(
            (test, listtrips) => DateTime.fromMillisecondsSinceEpoch(
              int.parse(test),
            ).isAfter(DateTime.now().subtract(const Duration(days: 1))),
          );

          // Convertir el mapa a una lista plana para el ListView
          final List<Widget> listItems = [];
          //organizar por fecha
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
                  "${DateTime.fromMillisecondsSinceEpoch(int.parse(date)).day}/${DateTime.fromMillisecondsSinceEpoch(int.parse(date)).month}/${DateTime.fromMillisecondsSinceEpoch(int.parse(date)).year}",
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
          return StandardErrorPage(
            icon: Icons.info,
            firstText: "Error",
            secondText: "No se pudo obtener el historial de viajes",
          );
          // Datos falsos para mostrar en caso de error
          // final List<TripEntity> fakeTrips = [
          //   TripEntity(
          //     id: 101,
          //     date: '15/05/25',
          //     departureTime: '8:00',
          //     returnTime: '14:00',
          //   ),
          //   TripEntity(
          //     id: 102,
          //     date: '15/05/25',
          //     departureTime: '10:30',
          //     returnTime: '16:30',
          //   ),
          //   TripEntity(
          //     id: 103,
          //     date: '14/05/25',
          //     departureTime: '9:15',
          //     returnTime: '15:15',
          //   ),
          //   TripEntity(
          //     id: 104,
          //     date: '14/05/25',
          //     departureTime: '14:00',
          //     returnTime: '20:00',
          //   ),
          //   TripEntity(
          //     id: 105,
          //     date: '13/05/25',
          //     departureTime: '8:00',
          //     returnTime: '14:00',
          //   ),
          // ];

          // // Agrupar viajes por fecha
          // final Map<String, List<TripEntity>> tripsByDate = {};
          // for (final trip in fakeTrips) {
          //   if (!tripsByDate.containsKey(trip.date)) {
          //     tripsByDate[trip.date!] = [];
          //   }
          //   tripsByDate[trip.date]!.add(trip);
          // }

          // // Convertir el mapa a una lista plana para el ListView
          // final List<Widget> listItems = [];

          // tripsByDate.forEach((date, dateTrips) {
          //   // Añadir el encabezado de fecha
          //   listItems.add(
          //     Padding(
          //       padding: const EdgeInsets.only(
          //         top: 16.0,
          //         bottom: 8.0,
          //         left: 16.0,
          //         right: 16.0,
          //       ),
          //       child: Text(
          //         date,
          //         style: const TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   );

          //   // Añadir los viajes de esta fecha con ExpansionTile
          //   for (final trip in dateTrips) {
          //     listItems.add(
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 16.0,
          //           vertical: 4.0,
          //         ),
          //         child: ExpandableTripCard(trip: trip),
          //       ),
          //     );
          //   }
          // });

          // return ListView(children: listItems);
        },
      ),
    );
  }
}
