import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Variables {
  static const String baseUrl = 'https://api.kamae.app/api/v1/';
  static const String domain = 'https://api.kamae.app/';

  static const Color primaryColor = Color(0xFF008080);
  static const Color secondaryColor = Color(0xffFFCCE4);
  static const Color purpleDeep = Color(0xff2503B9);
  static const Color purpleLite = Color(0xff6210E1);
  static const Color appBgColor = Color(0xffF7F2FF);
  static const Color textColor = Color(0xff323232);
  static const Color hintColor = Color(0xffA7A7A7);

  static const Map<int, Color> primaryColorMap = {
    50: Color.fromRGBO(0, 128, 128, .1),
    100: Color.fromRGBO(0, 128, 128, .2),
    200: Color.fromRGBO(0, 128, 128, .3),
    300: Color.fromRGBO(0, 128, 128, .4),
    400: Color.fromRGBO(0, 128, 128, .5),
    500: Color.fromRGBO(0, 128, 128, .6),
    600: Color.fromRGBO(0, 128, 128, .7),
    700: Color.fromRGBO(0, 128, 128, .8),
    800: Color.fromRGBO(0, 128, 128, .9),
    900: Color.fromRGBO(0, 128, 128, 1),
  };

  // static var statusBarTheme = SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //         statusBarColor: appBgColor,
  //         statusBarBrightness: Brightness.light,
  //         statusBarIconBrightness: Brightness.dark));

  // static var portraitMood = SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  static ThemeData themeData = ThemeData(
      backgroundColor: appBgColor,
      primarySwatch: Colors.teal,
      fontFamily: 'balooDa2',
      textTheme: const TextTheme(
          headline1: TextStyle(fontFamily: "balooDa2"),
          headline2: TextStyle(fontFamily: "balooDa2"),
          headline3: TextStyle(fontFamily: "balooDa2"),
          headline4: TextStyle(fontFamily: "balooDa2"),
          headline5: TextStyle(fontFamily: "balooDa2"),
          headline6: TextStyle(fontFamily: "balooDa2"),
          subtitle1: TextStyle(fontFamily: "balooDa2"),
          subtitle2: TextStyle(fontFamily: "balooDa2"),
          bodyText1: TextStyle(fontFamily: "balooDa2"),
          bodyText2: TextStyle(fontFamily: "balooDa2"),
          caption: TextStyle(fontFamily: "balooDa2"),
          button: TextStyle(fontFamily: "balooDa2"),
          overline: TextStyle(fontFamily: "balooDa2")));
}
