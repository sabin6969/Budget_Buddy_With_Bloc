import 'package:budgetbuddy_bloc/app.dart';
import 'package:budgetbuddy_bloc/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late UserPreferences userPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  userPreferences = UserPreferences();
  await userPreferences.initializePreferences();
  runApp(
    MyApp(
      isUserFirstTimeHere: userPreferences.checkIfUserIsFirstTime(),
      isUserLoggedIn: userPreferences.checkIfUserIsLoggedIn(),
    ),
  );
}
