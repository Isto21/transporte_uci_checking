import 'package:transporte_uci_checking/data/datasources/mappers/mappers.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/request_remote_repository.dart';

class TripApi extends TripRemoteRepository {
  final MyDio _myDio;

  TripApi(this._myDio);

  @override
  Future checkIn(String id, List<String> passengers) async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '/trip/checkIn',
        data: {"id": id, "passengers": passengers},
      );
      return true;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }

  @override
  Future getAll() async {
    try {
      final json = await _myDio.request(
        requestType: RequestType.GET,
        path: '/trip',
      );
      final TripEntity user = Mappers().tripMapperToEntity(Trip.fromJson(json));
      return user;
    } on CustomDioError catch (_) {
      rethrow;
    } catch (e) {
      throw CustomDioError(code: 400);
    }
  }
}
