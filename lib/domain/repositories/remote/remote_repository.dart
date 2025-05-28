import 'package:transporte_uci_checking/domain/repositories/remote/usecases/address_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/client_remote_reposiroty.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/request_remote_repositoy.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/transport_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/trip_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/user_remote_repository.dart';

abstract class RemoteRepository {
  AuthRemoteRepository get auth;
  TripRemoteRepository get trip;
  ClientRemoteRepository get client;
  AddressRemoteRepository get address;
  RequestRemoteRepository get request;
  TransportRemoteRepository get transport;
  UserRemoteRepository get user;
}
