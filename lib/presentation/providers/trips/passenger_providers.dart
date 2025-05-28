import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/domain/entities/user.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/trip_providers.dart';

// Provider para obtener pasajeros de un viaje específico
final userEnitysProvider = FutureProvider.family<List<UserEnity>, int>((
  ref,
  tripId,
) async {
  final apiService = ref.watch(userApiServiceProvider);
  return await apiService.getAll();
});

// Provider para el estado de selección de pasajeros
final selectedUserEnitysProvider = StateProvider<List<UserEnity>>((ref) => []);

// Provider para añadir/quitar un pasajero de la selección
final toggleUserEnitySelectionProvider = Provider.family<void, UserEnity>((
  ref,
  userEnity,
) {
  final selectedUserEnitys = ref.watch(selectedUserEnitysProvider);
  final isSelected = selectedUserEnitys.contains(userEnity);

  if (isSelected) {
    ref.read(selectedUserEnitysProvider.notifier).state =
        selectedUserEnitys.where((p) => p.name != userEnity.name).toList();
  } else {
    ref.read(selectedUserEnitysProvider.notifier).state = [
      ...selectedUserEnitys,
      userEnity,
    ];
  }
});
