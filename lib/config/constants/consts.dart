import 'package:flutter/material.dart';

class ApkConstants {
  // Language
  static String language(int index) {
    switch (index) {
      case 0:
        return 'English';
      case 1:
        return 'Spanish';
      case 2:
        return 'System';
      default:
        return 'System';
    }
  }

  // Brightness
  static const int lightMode = 0;
  static const int darkMode = 1;
  static const int autoMode = 2;

  // Marca
  static const int isNotLogged = 0;
  static const int onRegister = 1;
  static const int isLogged = 2;

  // Veirification Code
  static const int isVerificationCode = 0;
  static const int isChangeMainSession = 1;

  // static const int isLogged = 2;

  static const String MontserratFont = 'Montserrat';
  static const String MontserratBoldFont = 'MontserratBold';
  static const String MontserratMediumFont = 'MontserratMedium';
  static const String MontserratLightFont = 'MontserratLight';

  // SLivers
  static const double maxExtentTemp = 180;
  static const double minExtentTemp = 120;
  static const double ordersExtentTemp = 120;
  static const double moveSearch = 10;

  //Colors
  static const Color primaryApkColor = Color(0xFF4F6A8E);
  static const Color lightApkColor = Color.fromARGB(255, 69, 96, 102);
  static const Color lightGreenApkColor = Color(0xffDDE8A3);
  static const Color redApkColor = Color(0xffD80027);
  static const Color greyApkColor = Color(0xffCBCBCB);
}

class AppConfig {
  static const String languageDefault = "en";
  static final Map<String, AppLanguage> languagesSupported = {
    "en": AppLanguage("English"),
    // "ar": AppLanguage("عربى"),
    // "pt": AppLanguage("Portugal"),
    // "fr": AppLanguage("Français"),
    // "id": AppLanguage("Bahasa Indonesia"),
    "es": AppLanguage("Español"),
    // "it": AppLanguage("italiano"),
    // "tr": AppLanguage("Türk"),
    // "sw": AppLanguage("Kiswahili"),
    // "de": AppLanguage("Deutsch"),
    // "ro": AppLanguage("Română"),
  };
}

class AppLanguage {
  final String name;
  // final Map<String, String> values;
  AppLanguage(this.name);
}

class ApkConsts {
  static const String splashLogo = 'assets/appbarIcon.svg';
  static const String apkVersion = '1.0.0';
  static const String apkLogo = 'assets/ic_launcher.png';
}

class MetricsConsts {
  static const double clipperSize = 250;
  // vertical: 32, horizontal: 40
  static const double bottomVerticalPadding = 32;
  static const double bottomHorizontalPadding = 40;
}

class HeroTagConsts {
  static const String showImage = 'ShowImage';
  static const String profileImage = 'ProfileImage';
  static String cardImage(String image) => 'CardImage$image';
  static heroAnimation(int index, String tag) => "heroAnimation$index$tag";
}

class ViewConsts {
  static const int withoutConectionView = 0;
  static const int homeView = 1;
  static const int settingsView = 2;
}
