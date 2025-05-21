import 'package:transporte_uci_checking/data/datasources/models/enums/trip_status_enum.dart';
import 'package:transporte_uci_checking/domain/entities/request.dart';

class TripEntity {
  final int? id;
  final String date;
  final String departureTime;
  final String returnTime;
  final TripStatusEnum status;
  final List<RequestEntity>? requests;

  TripEntity({
    this.id,
    required this.date,
    required this.departureTime,
    required this.returnTime,
    this.status = TripStatusEnum.READY,
    this.requests,
  });
}
