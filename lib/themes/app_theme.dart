import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lighModeTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    // scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
      ),
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
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    // scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 14.sp,
        color: Colors.white,
      ),
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
