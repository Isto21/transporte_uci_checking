import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/config/utils/date_utils.dart';
import 'package:transporte_uci_checking/data/datasources/models/enums/trip_status_enum.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/trip_providers.dart';
import 'package:transporte_uci_checking/presentation/views/passenger_list_screen.dart';
import 'package:transporte_uci_checking/presentation/widgets/shared/standard_error_page.dart';
import 'package:transporte_uci_checking/presentation/widgets/trip_grid_card.dart';

class MyTripsScreen extends ConsumerWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsync = ref.watch(tripsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Viajes')),
      body: tripsAsync.when(
        data: (trips) {
          // Agrupar viajes por fecha
          final Map<String, List<TripEntity>> tripsByDate = {};
          final now = DateTime.now();
          final today = DateTime(now.year, now.month, now.day);

          for (final trip in trips) {
            final tripDate = DateTime.fromMillisecondsSinceEpoch(
              int.parse(trip.date!),
            );
            final tripDateTime = DateTime(
              tripDate.year,
              tripDate.month,
              tripDate.day,
            );

            // Incluir viajes que son para mañana o después, o los de hoy que estén ready
            if (tripDateTime.isAfter(today) ||
                (tripDateTime.isAtSameMomentAs(today) &&
                    trip.status == TripStatusEnum.READY)) {
              if (!tripsByDate.containsKey(trip.date)) {
                tripsByDate[trip.date!] = [];
              }
              tripsByDate[trip.date]!.add(trip);
            }
          }

          // Convertir el mapa a una lista de entradas para el ListView
          final dateEntries = tripsByDate.entries.toList();
          dateEntries.sort((a, b) => a.key.compareTo(b.key));

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: dateEntries.length,
            itemBuilder: (context, dateIndex) {
              final dateEntry = dateEntries[dateIndex];
              final dateTrips = dateEntry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(
                      AppDateUtils.formatDate(dateEntry.key),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (dateTrips.length == 1)
                    // Un solo viaje
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => PassengerListScreen(
                                  tripId: dateTrips[0].id!,
                                ),
                          ),
                        );
                      },
                      child: TripGridCard(trip: dateTrips[0]),
                    )
                  else
                    // Múltiples viajes en una fila (máximo 2)
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        for (int i = 0; i < dateTrips.length; i += 2)
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => PassengerListScreen(
                                              tripId: dateTrips[i].id!,
                                            ),
                                      ),
                                    );
                                  },
                                  child: TripGridCard(trip: dateTrips[i]),
                                ),
                              ),
                              if (i + 1 < dateTrips.length) ...[
                                const SizedBox(width: 12),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => PassengerListScreen(
                                                tripId: dateTrips[i + 1].id!,
                                              ),
                                        ),
                                      );
                                    },
                                    child: TripGridCard(trip: dateTrips[i + 1]),
                                  ),
                                ),
                              ] else
                                const Expanded(child: SizedBox()),
                            ],
                          ),
                      ],
                    ),
                  const SizedBox(height: 8),
                ],
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return StandardErrorPage(
            icon: Icons.error,
            firstText: 'Error',
            secondText: 'No se pudo cargar los viajes',
          );
        },
      ),
    );
  }
}
