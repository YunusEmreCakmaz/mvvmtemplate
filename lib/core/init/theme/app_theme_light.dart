import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'ilight_theme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        fontFamily: ApplicationConstants.POPPINS,
        tabBarTheme: TabBarTheme(
          labelPadding: paddingInsets.lowPaddingAll,
          unselectedLabelStyle:
              textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
        ),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
      );

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
      headline3: textThemeLight.headline3,
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight.black,
        primaryVariant: Colors.white, //xx
        secondary: Colors.green,
        secondaryVariant: colorSchemeLight.azure,
        surface: Colors.blue, //xx
        background: Color(0xfff6f9fc), //xx
        error: Colors.red[900],
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Colors.orange, //xx
        brightness: Brightness.light);
  }
}
