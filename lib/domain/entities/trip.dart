// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
import 'package:transporte_uci_checking/data/datasources/models/enums/trip_status_enum.dart';
import 'package:transporte_uci_checking/domain/entities/request.dart';

part 'trip.g.dart';

@collection
class TripEntity {
  final Id isarId = Isar.autoIncrement;
  final int? id;
  final int? transportationId;
  final String? date;
  final String? departureTime;
  final String? returnTime;
  final List<RequestEntity>? requests;
  @enumerated
  final TripStatusEnum status;

  TripEntity({
    this.id,
    this.transportationId,
    this.date,
    this.departureTime,
    this.returnTime,
    this.requests,
    this.status = TripStatusEnum.READY,
  });
}
