import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/domain/repositories/local/local_repository.dart';

class IsarService extends LocalIsarRepository {
  late Future<Isar> _db;

  IsarService() {
    _db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dr = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [TripEntitySchema],
        directory: dr.path,
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> deleteTrip(int tripId) async {
    final isar = await _db;
    await isar.tripEntitys.delete(tripId);
  }

  @override
  Future<List<TripEntity>> getAll() async {
    final isar = await _db;
    return await isar.tripEntitys.where().findAll();
  }

  @override
  Future<void> saveAll(List<TripEntity> trips) async {
    final isar = await _db;
    await isar.tripEntitys.putAll(trips);
  }
}
