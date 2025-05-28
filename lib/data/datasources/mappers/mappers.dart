import 'package:transporte_uci_checking/data/datasources/models/address.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/client.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/request.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/user.module.dart';
import 'package:transporte_uci_checking/domain/entities/address.dart';
import 'package:transporte_uci_checking/domain/entities/client.dart';
import 'package:transporte_uci_checking/domain/entities/request.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';
import 'package:transporte_uci_checking/domain/entities/user.dart';

class Mappers {
  ClientEntity clientMapperToEntity(ClientModel client) {
    return ClientEntity(
      id: client.id,
      name: client.name,
      acronym: client.acronym,
    );
  }

  UserEnity userMapperToEntity(User user) {
    return UserEnity(
      name: user.name,
      lastName: user.lastName,
      email: user.email,
      role: user.role,
      cardNumber: user.cardNumber,
    );
  }

  List<UserEnity> listUserMapperToEntity(List<User> users) {
    return users.map((user) => userMapperToEntity(user)).toList();
  }

  AddressEntity addressMapperToEntity(Address address) {
    return AddressEntity(
      id: address.id,
      coordinates: address.coordinates,
      street: address.street,
      number: address.number,
      municipality: address.municipality,
      clientId: address.clientId,
    );
  }

  RequestEntity requestMapperToEntity(Request request) {
    return RequestEntity(
      id: request.id,
      areaYouRequest: request.areaYouRequest,
      date: request.date,
      departureTime: request.departureTime,
      isAoutbound: request.isAoutbound,
      returnTime: request.returnTime,
      isInbound: request.isInbound,
      workers: request.workers,
      addressId: request.addressId,
    );
  }

  TripEntity tripMapperToEntity(Trip trip) {
    return TripEntity(
      id: trip.id,
      date: trip.date ?? '',
      departureTime: trip.departureTime ?? '',
      returnTime: trip.returnTime ?? '',
      transportationId: trip.transportationId,
      requests:
          trip.requests
              ?.map((request) => requestMapperToEntity(request))
              .toList(),
    );
  }

  List<TripEntity> listTripMapperToEntity(List<Trip> trips) {
    return trips.map((trip) => tripMapperToEntity(trip)).toList();
  }

  Trip tripToModel(TripEntity trip) {
    return Trip(
      date: trip.date,
      id: trip.id,
      departureTime: trip.departureTime,
      returnTime: trip.returnTime,
      transportationId: trip.transportationId,
      requests:
          trip.requests
              ?.map((request) => requestMapperToModel(request))
              .toList(),
    );
  }

  Request requestMapperToModel(RequestEntity request) {
    return Request(
      id: request.id,
      areaYouRequest: request.areaYouRequest,
      workers: request.workers,
      addressId: request.addressId,
      date: request.date,
      departureTime: request.departureTime,
      isAoutbound: request.isAoutbound,
      returnTime: request.returnTime,
      isInbound: request.isInbound,
    );
  }
}
