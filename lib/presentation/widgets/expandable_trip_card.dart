import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';
import 'package:transporte_uci_checking/config/utils/date_utils.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/presentation/providers/data/local_data_provider.riverpod.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/passenger_providers.dart';

class ExpandableTripCard extends ConsumerWidget {
  final TripEntity trip;

  const ExpandableTripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Solo cargamos los pasajeros cuando el tile está expandido
    final passengersAsync = ref.watch(passnegerProvider);
    if (passengersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Dismissible(
      key: Key(trip.id!.toString()),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: const Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: const Icon(Icons.delete),
      ),
      onDismissed: (direction) {
        ref.read(localDatabaseProvider).deleteTrip(trip.id!);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.all(16),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hora: ${AppDateUtils.formatTime(trip.departureTime)}- ${AppDateUtils.formatTime(trip.returnTime)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: ApkConstants.primaryApkColor,
                ),
              ),
            ],
          ),
          children: [
            buildTripDetails(),
            const SizedBox(height: 16),
            buildPassengersList(ref, context),
          ],
        ),
      ),
    );
  }

  Widget buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detalles del viaje',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        buildDetailRow('Fecha:', AppDateUtils.formatDate(trip.date)),
        buildDetailRow(
          'Hora de salida:',
          AppDateUtils.formatTime(trip.departureTime) ?? 'Indefinida',
        ),
        buildDetailRow(
          'Hora de regreso:',
          AppDateUtils.formatTime(trip.returnTime) ?? 'Indefinida',
        ),
        trip.transportationId != null
            ? buildDetailRow('Vehículo:', trip.transportationId.toString())
            : const SizedBox(),
      ],
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }

  Widget buildPassengersList(WidgetRef ref, context) {
    final passengersAsync = ref.watch(passnegerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pasajeros',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        SizedBox(
          height: 200, // Altura fija para la lista de pasajeros
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: passengersAsync.passengers?.length,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.person, size: 20),
                title: Text(passengersAsync.passengers?[index].name ?? ''),
              );
            },
          ),
        ),
      ],
    );
  }
}
