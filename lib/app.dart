import 'package:budgetbuddy_bloc/pages/home_page.dart';
import 'package:budgetbuddy_bloc/pages/login_page.dart';
import 'package:budgetbuddy_bloc/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final bool isUserFirstTimeHere;
  final bool isUserLoggedIn;
  const MyApp({
    super.key,
    required this.isUserFirstTimeHere,
    required this.isUserLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: isUserFirstTimeHere
          ? const OnboadingPage()
          : isUserLoggedIn
              ? const HomePage()
              : const LoginPage(),
    );
  }
}
