import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/request_remote_repository.dart';

abstract class RemoteRepository {
  AuthRemoteRepository get auth;
  TripRemoteRepository get trip;
}
