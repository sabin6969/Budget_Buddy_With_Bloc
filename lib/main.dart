import 'package:budgetbuddy_bloc/app.dart';
import 'package:budgetbuddy_bloc/firebase_options.dart';
import 'package:budgetbuddy_bloc/user_preferences/user_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late UserPreferences userPreferences;
late Size size;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
