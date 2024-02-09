import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/pages/auth/signup/signup_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpPageRoute:
        return MaterialPageRoute(builder: (context) => SignupPage());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
