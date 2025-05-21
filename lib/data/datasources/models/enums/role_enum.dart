enum RoleEnum {
  DIRECTOR_CENTRO,
  ADMIN,
  SUPER_ADMIN,
}

extension RoleEnumExtension on RoleEnum {
  String get value {
    switch (this) {
      case RoleEnum.DIRECTOR_CENTRO:
        return 'DIRECTOR_CENTRO';
      case RoleEnum.ADMIN:
        return 'ADMIN';
      case RoleEnum.SUPER_ADMIN:
        return 'SUPER_ADMIN';
    }
  }

  static RoleEnum fromString(String value) {
    switch (value) {
      case 'DIRECTOR_CENTRO':
        return RoleEnum.DIRECTOR_CENTRO;
      case 'ADMIN':
        return RoleEnum.ADMIN;
      case 'SUPER_ADMIN':
        return RoleEnum.SUPER_ADMIN;
      default:
        return RoleEnum.DIRECTOR_CENTRO;
    }
  }
}
