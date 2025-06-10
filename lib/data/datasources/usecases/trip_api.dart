import 'package:transporte_uci_checking/data/datasources/mappers/mappers.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/trip_remote_repository.dart';

class TripApi extends TripRemoteRepository {
  final MyDio _myDio;

  TripApi(this._myDio);

  @override
  Future<bool> checkIn(String id, List<String> passengers) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.POST,
        path: '/trip/checkIn/$id',
        data: {"people": passengers},
      );
      return true;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<List<TripEntity>> getAll() async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '/trip',
      );
      final List<TripEntity> user = Mappers().listTripMapperToEntity(
        List<Trip>.from(
          (json['data']['trips'] as List<dynamic>).map<Trip>(
            (x) => Trip.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

      return user;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<List<TripEntity>> getAllPersonalTrip(String id) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '/trip/getAllPersonalTrip/$id',
      );
      final List<TripEntity> user = Mappers().listTripMapperToEntity(
        List<Trip>.from(
          (json['data']['trips'] as List<dynamic>).map<Trip>(
            (x) => Trip.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

      return user;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future<void> postTrip(TripEntity trip) async {
    try {
      await _myDio.request(
        requestType: RequestType.POST,
        path: '/trip',
        data: Mappers().tripToModel(trip),
      );
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }
}
