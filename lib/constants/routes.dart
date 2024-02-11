import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/pages/auth/forgot_password/forgot_password_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/forgot_password/forgot_password_sent_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/login/login_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/signup/signup_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpPageRoute:
        return MaterialPageRoute(builder: (context) => const SignupPage());
      case AppRoutes.loginPageRoute:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case AppRoutes.resetPasswordPageRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordPage(),
        );
      case AppRoutes.resentEmailSentPageRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordSentPage(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
