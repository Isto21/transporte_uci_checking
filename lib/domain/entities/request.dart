import 'package:transporte_uci_checking/data/datasources/models/enums/request_status_enum.dart';
import 'package:transporte_uci_checking/domain/entities/address.dart';
import 'package:transporte_uci_checking/domain/entities/trip.dart';

class RequestEntity {
  final int? id;
  final String areaYouRequest;
  final String date;
  final String? departureTime;
  final bool? isAoutbound;
  final String? returnTime;
  final bool? isInbound;
  final int numberOfPeople;
  final RequestStatusEnum status;
  final AddressEntity? address;
  final TripEntity? trip;

  RequestEntity({
    this.id,
    required this.areaYouRequest,
    required this.date,
    this.departureTime,
    this.isAoutbound,
    this.returnTime,
    this.isInbound,
    required this.numberOfPeople,
    this.status = RequestStatusEnum.PENDING,
    this.address,
    this.trip,
  });
}
