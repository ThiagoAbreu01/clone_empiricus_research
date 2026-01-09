import 'package:clone_empiricus_research/app/core/ui/styles/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomThemeSwitcher {
  static ThemeData get themeType => themeNotifier.value;

  static Future<void> initializeTheme() async {
    try {
      themeNotifier.value = AppLightTheme.data;
    } on PlatformException {
      themeNotifier.value = AppDarkTheme.data;
    }
  }

  static ValueNotifier<ThemeData> themeNotifier = ValueNotifier<ThemeData>(
    AppDarkTheme.data,
  );

  static void switchToDarkTheme() async {
    themeNotifier.value = AppDarkTheme.data;
  }

  static void switchToLightTheme() async {
    themeNotifier.value = AppLightTheme.data;
  }
}
