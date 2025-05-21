import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/datasources/models/passenger.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/passenger_providers.dart';

class ExpandableTripCard extends ConsumerWidget {
  final Trip trip;

  const ExpandableTripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Solo cargamos los pasajeros cuando el tile está expandido
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        childrenPadding: const EdgeInsets.all(16),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '18 Pasajeros',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Hora: ${trip.departureTime}',
              style: const TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ],
        ),
        children: [
          _buildTripDetails(),
          const SizedBox(height: 16),
          _buildPassengersList(ref, context),
        ],
      ),
    );
  }

  Widget _buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Detalles del viaje',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildDetailRow('Fecha:', trip.date),
        _buildDetailRow('Hora de salida:', trip.departureTime),
        _buildDetailRow('Hora de regreso:', trip.returnTime),
        _buildDetailRow('Estado:', 'Completado'),
        _buildDetailRow('Vehículo:', 'Bus #A-123'),
        _buildDetailRow('Conductor:', 'Juan Pérez'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
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

  Widget _buildPassengersList(WidgetRef ref, context) {
    final passengersAsync = ref.watch(passengersProvider(trip.id!));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pasajeros',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        passengersAsync.when(
          data: (passengers) {
            return SizedBox(
              height: 200, // Altura fija para la lista de pasajeros
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: passengers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.person, size: 20),
                    title: Text(passengers[index].name),
                  );
                },
              ),
            );
          },
          loading:
              () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
          error: (error, stackTrace) {
            // Datos falsos para mostrar en caso de error
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
              Passenger(name: 'Ronald Richards'),
              Passenger(name: 'Eleanor Pena'),
              Passenger(name: 'Kristin Watson'),
              Passenger(name: 'Courtney Henry'),
              Passenger(name: 'Leslie Alexander'),
              Passenger(name: 'Kristin Watson'),
              Passenger(name: 'Courtney Henry'),
              Passenger(name: 'Leslie Alexander'),
              // Mostramos solo 5 pasajeros en la vista expandida para no ocupar demasiado espacio
            ];

            return SizedBox(
              height: 200, // Altura fija para la lista de pasajeros
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: fakePassengers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.person, size: 20),
                    title: Text(fakePassengers[index].name),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
