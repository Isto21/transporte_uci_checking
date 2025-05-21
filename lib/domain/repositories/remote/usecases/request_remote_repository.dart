abstract class TripRemoteRepository {
  Future<dynamic> getAll();
  Future<dynamic> checkIn(String id, List<String> passengers);
}
