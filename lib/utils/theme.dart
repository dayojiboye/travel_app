import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimary = Color(0XFF020202);
const Color kGreen = Color(0XFFA3FEC8);
const Color kWhite = Color(0XFFFFFFFF);
const Color kIconBg = Color(0XFFFAFAFA);
const Color kSecondary = Color(0XFF98989A);

themeData(context) => ThemeData(
      fontFamily: GoogleFonts.inter().fontFamily,
      useMaterial3: false,
      primaryColor: kPrimary,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   selectedItemColor: kLightBlue,
      // ),
    );
