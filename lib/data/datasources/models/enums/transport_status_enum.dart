enum TransportStatusEnum {
  GOOD,
  BAD,
  MAINTENANCE,
}

extension TransportStatusEnumExtension on TransportStatusEnum {
  String get value {
    switch (this) {
      case TransportStatusEnum.GOOD:
        return 'GOOD';
      case TransportStatusEnum.BAD:
        return 'BAD';
      case TransportStatusEnum.MAINTENANCE:
        return 'MAINTENANCE';
    }
  }

  static TransportStatusEnum fromString(String value) {
    switch (value) {
      case 'GOOD':
        return TransportStatusEnum.GOOD;
      case 'BAD':
        return TransportStatusEnum.BAD;
      case 'MAINTENANCE':
        return TransportStatusEnum.MAINTENANCE;
      default:
        return TransportStatusEnum.GOOD;
    }
  }
}
