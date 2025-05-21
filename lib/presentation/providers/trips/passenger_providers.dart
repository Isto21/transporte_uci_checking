import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/datasources/models/passenger.module.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/trip_providers.dart';

// Provider para obtener pasajeros de un viaje específico
final passengersProvider = FutureProvider.family<List<Passenger>, int>((
  ref,
  tripId,
) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.getAll();
});

// Provider para el estado de selección de pasajeros
final selectedPassengersProvider = StateProvider<List<Passenger>>((ref) => []);

// Provider para añadir/quitar un pasajero de la selección
final togglePassengerSelectionProvider = Provider.family<void, Passenger>((
  ref,
  passenger,
) {
  final selectedPassengers = ref.watch(selectedPassengersProvider);
  final isSelected = selectedPassengers.contains(passenger);

  if (isSelected) {
    ref.read(selectedPassengersProvider.notifier).state =
        selectedPassengers.where((p) => p.name != passenger.name).toList();
  } else {
    ref.read(selectedPassengersProvider.notifier).state = [
      ...selectedPassengers,
      passenger,
    ];
  }
});
