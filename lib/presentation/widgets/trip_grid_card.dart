import 'package:flutter/material.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';

class TripGridCard extends StatelessWidget {
  final TripEntity trip;

  const TripGridCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ApkConstants.primaryApkColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '18 Pasajeros', // En un caso real, esto vendría del conteo de pasajeros en trip.requests
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ApkConstants.primaryApkColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Hora: ${trip.departureTime}',
            style: const TextStyle(
              fontSize: 14,
              color: ApkConstants.primaryApkColor,
            ),
          ),
        ],
      ),
    );
  }
}
