import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lighModeTheme = ThemeData(
    primaryColor: const Color(0xFF8A2BE2),
    secondaryHeaderColor: const Color.fromARGB(255, 171, 171, 225),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkModeTheme = ThemeData(
    primaryColor: const Color(0xFF8A2BE2),
    secondaryHeaderColor: const Color.fromARGB(255, 171, 171, 225),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}
