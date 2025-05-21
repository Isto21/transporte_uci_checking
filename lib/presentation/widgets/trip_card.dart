import 'package:flutter/material.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '18 Pasajeros', // En un caso real, esto vendría del conteo de pasajeros en trip.requests
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
            const Icon(Icons.keyboard_arrow_down, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
