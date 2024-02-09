import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lighModeTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.w),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.w,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.w),
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.sp,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    fontFamily: "Poppins",
    primaryColor: const Color(0xFF8A2BE2),
    secondaryHeaderColor: const Color.fromARGB(255, 171, 171, 225),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
  static ThemeData darkModeTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.w),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1.w,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.w),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.sp,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(centerTitle: true),
    fontFamily: "Poppins",
    primaryColor: const Color(0xFF8A2BE2),
    secondaryHeaderColor: const Color.fromARGB(255, 171, 171, 225),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
