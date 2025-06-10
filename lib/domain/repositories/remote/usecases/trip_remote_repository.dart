import 'package:transporte_uci_checking/domain/entities/trip.dart';

abstract class TripRemoteRepository {
  Future<void> postTrip(TripEntity trip);
  Future<List<TripEntity>> getAll();
  Future<List<TripEntity>> getAllPersonalTrip(String id);
  Future<bool> checkIn(String id, List<String> passengers);
}
