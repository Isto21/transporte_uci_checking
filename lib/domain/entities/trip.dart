// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:transporte_uci_checking/domain/entities/request.dart';

class TripEntity {
  final int? id;
  final int? transportationId;
  final String? date;
  final String? departureTime;
  final String? returnTime;
  final List<RequestEntity>? requests;
  TripEntity({
    this.id,
    this.transportationId,
    this.date,
    this.departureTime,
    this.returnTime,
    this.requests,
  });
}
