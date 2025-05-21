import 'package:transporte_uci_checking/data/datasources/usecases/auth_api.dart';
import 'package:transporte_uci_checking/data/datasources/usecases/trip_api.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/request_remote_repository.dart';

class ApiConsumer extends RemoteRepository {
  final String language;
  static RemoteRepository _instace({required language}) =>
      ApiConsumer._(language: language);
  late MyDio _myDio;
  late AuthApi _authApi;
  late TripApi _tripApi;
  static RemoteRepository getInstance({required language}) =>
      _instace(language: language);

  ApiConsumer._({required this.language}) {
    _myDio = MyDio(language: language);
    _authApi = AuthApi(_myDio);
    _tripApi = TripApi(_myDio);
  }

  @override
  AuthRemoteRepository get auth => _authApi;

  @override
  TripRemoteRepository get trip => _tripApi;
}
