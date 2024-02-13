import 'package:budgetbuddy_bloc/constants/routes.dart';
import 'package:budgetbuddy_bloc/pages/add_transaction/bloc/addtransaction_bloc.dart';
import 'package:budgetbuddy_bloc/pages/auth/forgot_password/bloc/forgotpassword_bloc.dart';
import 'package:budgetbuddy_bloc/pages/auth/login/bloc/login_bloc.dart';
import 'package:budgetbuddy_bloc/pages/auth/login/login_page.dart';
import 'package:budgetbuddy_bloc/pages/auth/signup/bloc/signup_bloc.dart';
import 'package:budgetbuddy_bloc/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:budgetbuddy_bloc/pages/home_page.dart';
import 'package:budgetbuddy_bloc/pages/onboarding_page.dart';
import 'package:budgetbuddy_bloc/pages/profile/bloc/profile_bloc.dart';
import 'package:budgetbuddy_bloc/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(376, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginBloc()),
            BlocProvider(create: (context) => ForgotpasswordBloc()),
            BlocProvider(create: (context) => SignupBloc()),
            BlocProvider(create: (context) => ProfileBloc()),
            BlocProvider(create: (context) => AddtransactionBloc()),
            BlocProvider(create: (context) => DashboardBloc())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lighModeTheme,
            themeMode: ThemeMode.system,
            darkTheme: AppTheme.darkModeTheme,
            onGenerateRoute: Routes.generateRoutes,
            home: isUserFirstTimeHere
                ? const OnboadingPage()
                : isUserLoggedIn
                    ? const HomePage()
                    : const LoginPage(),
          ),
        );
      },
    );
  }
}
