enum TripStatusEnum {
  READY,
  DONE,
  // IN_PROGRESS,
  // COMPLETED,
  // CANCELLED,
}

extension TripStatusEnumExtension on TripStatusEnum {
  String get value {
    switch (this) {
      case TripStatusEnum.READY:
        return 'ready';
      case TripStatusEnum.DONE:
        return 'done';
    }
  }

  static TripStatusEnum fromString(String value) {
    switch (value) {
      case 'ready':
        return TripStatusEnum.READY;
      case 'done':
        return TripStatusEnum.DONE;
      default:
        return TripStatusEnum.READY;
    }
  }
}
