import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/datasources/models/enums/trip_status_enum.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/trip_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/user_remote_repository.dart';
import 'package:transporte_uci_checking/presentation/providers/data/api_provider.riverpod.dart';
import 'package:transporte_uci_checking/presentation/providers/data/local_data_provider.riverpod.dart';

// Provider para el servicio API
final apiServiceProvider = Provider<TripRemoteRepository>((ref) {
  return ref.watch(apiProvider).trip;
});
final userApiServiceProvider = Provider<UserRemoteRepository>((ref) {
  return ref.watch(apiProvider).user;
});
// Provider para obtener todos los viajes
final tripsProvider = FutureProvider<List<TripEntity>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  final trips = await apiService.getAll();
  return trips.where((trip) => trip.status == TripStatusEnum.READY).toList();
});

final tripProvider = Provider<TripRemoteRepository>((ref) {
  return ref.watch(apiProvider).trip;
});

// Provider para obtener viajes históricos
final historicalTripsProvider = FutureProvider<List<TripEntity>>((ref) async {
  final localDatabase = ref.read(localDatabaseProvider);
  try {
    final apiService = ref.watch(apiServiceProvider);
    final List<TripEntity> trips = await apiService.getAll();
    await localDatabase.saveAll(trips);
    return trips.where((trip) => trip.status == TripStatusEnum.DONE).toList();
  } catch (e) {
    final trips = await localDatabase.getAll();
    return trips.where((trip) => trip.status == TripStatusEnum.DONE).toList();
  }
});

// Provider para agrupar viajes por fecha
final tripsByDateProvider = Provider<Map<String, List<TripEntity>>>((ref) {
  final tripsAsync = ref.watch(tripsProvider);

  return tripsAsync.when(
    data: (trips) {
      final Map<String, List<TripEntity>> groupedTrips = {};

      for (final trip in trips) {
        if (!groupedTrips.containsKey(trip.date)) {
          groupedTrips[trip.date!] = [];
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
final historicalTripsByDateProvider = Provider<Map<String, List<TripEntity>>>((
  ref,
) {
  final tripsAsync = ref.watch(historicalTripsProvider);

  return tripsAsync.when(
    data: (trips) {
      final Map<String, List<TripEntity>> groupedTrips = {};

      for (final trip in trips) {
        if (!groupedTrips.containsKey(trip.date)) {
          groupedTrips[trip.date!] = [];
        }
        groupedTrips[trip.date]!.add(trip);
      }

      return groupedTrips;
    },
    loading: () => {},
    error: (_, __) => {},
  );
});
