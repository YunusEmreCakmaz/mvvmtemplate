import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'ilight_theme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();
  @override
  ThemeData get theme => ThemeData(
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            brightness: Brightness.light, color: Colors.transparent, elevation: 0, iconTheme: IconThemeData(color: Colors.black87, size: 21)),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black12,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.3),
          ),
          /*focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),*/
          border: OutlineInputBorder(),
        ),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        fontFamily: ApplicationConstants.POPPINS,
        tabBarTheme: tabBarTheme,
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight.headline5,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light()
        .textTheme
        .copyWith(headline1: textThemeLight.headline1, headline2: textThemeLight.headline2, overline: textThemeLight.headline3);
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
        onError: Color(0xffffc93c),
        brightness: Brightness.light);
  }
}
