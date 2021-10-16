import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


ThemeData lightTheme =  ThemeData(
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[300],
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
  ),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      fontFamily: "Jannah",
      color: Colors.black,
    ),
  ),
  appBarTheme:  const AppBarTheme(
    elevation: 0.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Jannah',
        fontSize: 25.0
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
  ),
  primarySwatch: Colors.deepOrange,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      fontFamily: "Jannah",
      color: Colors.white,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: HexColor('333739'),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: const TextStyle(
        color: Colors.white, fontFamily: 'Jannah', fontSize: 25.0),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.black,
    ),
  ),
);