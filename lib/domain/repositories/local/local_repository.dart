import 'package:transporte_uci_checking/domain/entities/trip.dart';

abstract class LocalRepository {
  void saveLanguage(String language);
  String? getLanguage();
}

abstract class LocalIsarRepository {
  Future<List<TripEntity>> getAll();
  Future<void> saveAll(List<TripEntity> trips);
  Future<void> deleteTrip(int tripId);
}
