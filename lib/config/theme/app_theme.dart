import 'package:flutter/material.dart';
import 'package:transporte_uci_checking/config/constants/consts.dart';

const TextStyle displayLarge = TextStyle(fontSize: 34);
const TextStyle displayMedium = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.normal,
);
const TextStyle displaySmall = TextStyle(fontSize: 27);

const TextStyle bodyLarge = TextStyle(fontSize: 20);
const TextStyle bodyMedium = TextStyle(fontSize: 18);
const TextStyle bodySmall = TextStyle(fontSize: 15);

const TextStyle titleLarge = TextStyle(fontSize: 15);
const TextStyle titleMedium = TextStyle(fontSize: 14);
const TextStyle titleSmall = TextStyle(fontSize: 12);

class AppTheme {
  final int selectedColor;
  final int isDark;

  AppTheme({this.selectedColor = 0, this.isDark = ApkConstants.darkMode});

  ThemeData theme() {
    return _theme(isDark);
  }

  ThemeData themeLight() {
    return _theme(ApkConstants.lightMode);
  }

  ThemeData themeDark() {
    return _theme(ApkConstants.darkMode);
  }

  ThemeData _theme(int isDarkMode) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ApkConstants.primaryApkColor,
      brightness:
          (isDarkMode == ApkConstants.darkMode)
              ? Brightness.dark
              : (isDarkMode == ApkConstants.lightMode)
              ? Brightness.light
              : WidgetsBinding.instance.platformDispatcher.platformBrightness,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color:
              (isDarkMode == ApkConstants.darkMode)
                  ? Colors.white
                  : Colors.black,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: const BorderSide(
          color: ApkConstants.primaryApkColor,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: titleSmall.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 17,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ApkConstants.primaryApkColor,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ApkConstants.primaryApkColor,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIconColor: const Color(0xff9C9EA4),
        labelStyle: titleSmall.copyWith(fontSize: 17),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ApkConstants.primaryApkColor,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(4),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: ApkConstants.primaryApkColor),
            ),
          ),
          alignment: Alignment.center,
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(4),
          backgroundColor: const WidgetStatePropertyAll(
            ApkConstants.primaryApkColor,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          textStyle: const WidgetStatePropertyAll(bodyLarge),
          alignment: Alignment.center,
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  AppTheme copyWith({int? selectedColor, int? isDark}) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDark: isDark ?? this.isDark,
    );
  }
}
