// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/domain/entities/user.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/user_remote_repository.dart';
import 'package:transporte_uci_checking/presentation/providers/trips/trip_providers.dart';

final passnegerProvider =
    StateNotifierProvider<PassengerNotifier, PassengersStatus>((ref) {
      final apiService = ref.watch(userApiServiceProvider);

      return PassengerNotifier(apiService);
    });

class PassengerNotifier extends StateNotifier<PassengersStatus> {
  final UserRemoteRepository _userRemoteRepository;
  PassengerNotifier(this._userRemoteRepository) : super(PassengersStatus()) {
    loadPassengers();
  }

  Future<void> loadPassengers() async {
    state = state.copyWith(isLoading: true);
    try {
      final passengers = await _userRemoteRepository.getAll();
      state = state.copyWith(passengers: passengers, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void addPassenger(UserEnity userEnity) {
    state = state.copyWith(passengers: [...state.passengers!, userEnity]);
  }

  void toggleUserEnitySelection(UserEnity userEnity) {
    state = state.copyWith();
    toggleUserEnitySelectionProvider(userEnity);
  }
}

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

class PassengersStatus {
  List<UserEnity>? passengers;
  bool isLoading;
  PassengersStatus({this.passengers, this.isLoading = false});

  PassengersStatus copyWith({List<UserEnity>? passengers, bool? isLoading}) {
    return PassengersStatus(
      passengers: passengers ?? this.passengers,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
