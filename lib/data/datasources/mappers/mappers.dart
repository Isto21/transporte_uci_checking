import 'package:transporte_uci_checking/data/datasources/models/address.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/client.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/request.module.dart';
import 'package:transporte_uci_checking/data/datasources/models/trip.module.dart';
import 'package:transporte_uci_checking/domain/entities/address.dart';
import 'package:transporte_uci_checking/domain/entities/client.dart';
import 'package:transporte_uci_checking/domain/entities/request.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';

class Mappers {
  ClientEntity clientMapperToEntity(ClientModel client) {
    return ClientEntity(
      id: client.id,
      name: client.name,
      acronym: client.acronym,
      addresses:
          client.addresses
              ?.map((address) => addressMapperToEntity(address))
              .toList(),
    );
  }

  AddressEntity addressMapperToEntity(Address address) {
    return AddressEntity(
      id: address.id,
      coordinates: address.coordinates,
      street: address.street,
      number: address.number,
      municipality: address.municipality,
      client:
          address.client != null ? clientMapperToEntity(address.client!) : null,
      requests:
          address.requests
              ?.map((request) => requestMapperToEntity(request))
              .toList(),
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
      numberOfPeople: request.numberOfPeople,
      status: request.status,
      address: addressMapperToEntity(request.address!),
      trip: request.trip != null ? tripMapperToEntity(request.trip!) : null,
    );
  }

  TripEntity tripMapperToEntity(Trip trip) {
    return TripEntity(
      id: trip.id,
      date: trip.date,
      departureTime: trip.departureTime,
      returnTime: trip.returnTime,
      status: trip.status,
      requests:
          trip.requests
              ?.map((request) => requestMapperToEntity(request))
              .toList(),
    );
  }
}
