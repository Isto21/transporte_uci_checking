enum TripStatusEnum {
  READY,
  IN_PROGRESS,
  COMPLETED,
  CANCELLED,
}

extension TripStatusEnumExtension on TripStatusEnum {
  String get value {
    switch (this) {
      case TripStatusEnum.READY:
        return 'READY';
      case TripStatusEnum.IN_PROGRESS:
        return 'IN_PROGRESS';
      case TripStatusEnum.COMPLETED:
        return 'COMPLETED';
      case TripStatusEnum.CANCELLED:
        return 'CANCELLED';
    }
  }

  static TripStatusEnum fromString(String value) {
    switch (value) {
      case 'READY':
        return TripStatusEnum.READY;
      case 'IN_PROGRESS':
        return TripStatusEnum.IN_PROGRESS;
      case 'COMPLETED':
        return TripStatusEnum.COMPLETED;
      case 'CANCELLED':
        return TripStatusEnum.CANCELLED;
      default:
        return TripStatusEnum.READY;
    }
  }
}
