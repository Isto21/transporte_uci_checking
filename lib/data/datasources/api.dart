import 'package:transporte_uci_checking/data/datasources/usecases/address_api.dart';
import 'package:transporte_uci_checking/data/datasources/usecases/auth_api.dart';
import 'package:transporte_uci_checking/data/datasources/usecases/client_api.dart';
import 'package:transporte_uci_checking/data/datasources/usecases/request_api.dart';
import 'package:transporte_uci_checking/data/datasources/usecases/transport_api.dart';
import 'package:transporte_uci_checking/data/datasources/usecases/trip_api.dart';
import 'package:transporte_uci_checking/data/datasources/usecases/user_api.dart';
import 'package:transporte_uci_checking/data/dio/my_dio.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/address_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/client_remote_reposiroty.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/request_remote_repositoy.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/transport_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/trip_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/user_remote_repository.dart';

class ApiConsumer extends RemoteRepository {
  final String language;
  static RemoteRepository _instace({required language}) =>
      ApiConsumer._(language: language);
  late MyDio _myDio;
  late AuthApi _authApi;
  late TripApi _tripApi;
  late AddressApi _addressApi;
  late ClientApi _clientApi;
  late RequestApi _requestApi;
  late TransportApi _transportApi;
  late UserApi _userApi;
  static RemoteRepository getInstance({required language}) =>
      _instace(language: language);

  ApiConsumer._({required this.language}) {
    _myDio = MyDio(language: language);
    _authApi = AuthApi(_myDio);
    _tripApi = TripApi(_myDio);
    _addressApi = AddressApi(_myDio);
    _clientApi = ClientApi(_myDio);
    _requestApi = RequestApi(_myDio);
    _transportApi = TransportApi(_myDio);
    _userApi = UserApi(_myDio);
  }

  @override
  AuthRemoteRepository get auth => _authApi;

  @override
  TripRemoteRepository get trip => _tripApi;

  @override
  AddressRemoteRepository get address => _addressApi;

  @override
  ClientRemoteRepository get client => _clientApi;

  @override
  RequestRemoteRepository get request => _requestApi;

  @override
  TransportRemoteRepository get transport => _transportApi;

  @override
  UserRemoteRepository get user => _userApi;
}
