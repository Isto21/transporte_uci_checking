import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/request_remote_repository.dart';
import 'package:transporte_uci_checking/presentation/providers/data/api_provider.riverpod.dart';

// Provider para el servicio API
final apiServiceProvider = Provider<TripRemoteRepository>((ref) {
  return ref.watch(apiProvider).trip;
});

// Provider para obtener todos los viajes
final tripsProvider = FutureProvider<List<Trip>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.getAll();
});

// Provider para obtener viajes históricos
final historicalTripsProvider = FutureProvider<List<Trip>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.getAll();
});

// Provider para agrupar viajes por fecha
final tripsByDateProvider = Provider<Map<String, List<Trip>>>((ref) {
  final tripsAsync = ref.watch(tripsProvider);

  return tripsAsync.when(
    data: (trips) {
      final Map<String, List<Trip>> groupedTrips = {};

      for (final trip in trips) {
        if (!groupedTrips.containsKey(trip.date)) {
          groupedTrips[trip.date] = [];
        }
        groupedTrips[trip.date]!.add(trip);
      }

      return groupedTrips;
    },
    loading: () => {},
    error: (_, __) => {},
  );
});

// Provider para agrupar viajes históricos por fecha
final historicalTripsByDateProvider = Provider<Map<String, List<Trip>>>((ref) {
  final tripsAsync = ref.watch(historicalTripsProvider);

  return tripsAsync.when(
    data: (trips) {
      final Map<String, List<Trip>> groupedTrips = {};

      for (final trip in trips) {
        if (!groupedTrips.containsKey(trip.date)) {
          groupedTrips[trip.date] = [];
        }
        groupedTrips[trip.date]!.add(trip);
      }

      return groupedTrips;
    },
    loading: () => {},
    error: (_, __) => {},
  );
});
