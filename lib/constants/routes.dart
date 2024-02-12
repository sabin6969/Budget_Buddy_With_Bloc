import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/pages/add_transaction/add_transaction_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/forgot_password/forgot_password_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/forgot_password/forgot_password_sent_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/login/login_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/signup/signup_page.dart';
import 'package:budgetbuddy_bloc/pages/home_page.dart';
import 'package:budgetbuddy_bloc/pages/notification_page.dart';
import 'package:budgetbuddy_bloc/pages/profile/profile_page.dart';
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
      case AppRoutes.homePageRoute:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case AppRoutes.addExpenseIncomePage:
        return MaterialPageRoute(
          builder: (context) => const AddExpenseIncomePage(),
        );
      case AppRoutes.resentEmailSentPageRoute:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordSentPage(),
        );
      case AppRoutes.profilePageRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );
      case AppRoutes.notificationPageRoute:
        return MaterialPageRoute(
          builder: (context) => const NotificationPage(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
