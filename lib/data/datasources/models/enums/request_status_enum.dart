enum RequestStatusEnum {
  PENDING,
  APPROVED,
  REJECTED,
  COMPLETED,
  CANCELLED,
}

extension RequestStatusEnumExtension on RequestStatusEnum {
  String get value {
    switch (this) {
      case RequestStatusEnum.PENDING:
        return 'PENDING';
      case RequestStatusEnum.APPROVED:
        return 'APPROVED';
      case RequestStatusEnum.REJECTED:
        return 'REJECTED';
      case RequestStatusEnum.COMPLETED:
        return 'COMPLETED';
      case RequestStatusEnum.CANCELLED:
        return 'CANCELLED';
    }
  }

  static RequestStatusEnum fromString(String value) {
    switch (value) {
      case 'PENDING':
        return RequestStatusEnum.PENDING;
      case 'APPROVED':
        return RequestStatusEnum.APPROVED;
      case 'REJECTED':
        return RequestStatusEnum.REJECTED;
      case 'COMPLETED':
        return RequestStatusEnum.COMPLETED;
      case 'CANCELLED':
        return RequestStatusEnum.CANCELLED;
      default:
        return RequestStatusEnum.PENDING;
    }
  }
}
