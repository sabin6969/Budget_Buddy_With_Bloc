import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  late SharedPreferences sharedPreferences;

  Future<void> initializePreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool checkIfUserIsLoggedIn() {
    return sharedPreferences.getBool("isLoggedIn") ?? false;
  }

  bool checkIfUserIsFirstTime() {
    return sharedPreferences.getBool("isFirstTimeUser") ?? true;
  }

  void markUserAsLoggedIn() async {
    await sharedPreferences.setBool("isLoggedIn", true);
  }

  void markUserAsNotFirstTime() async {
    await sharedPreferences.setBool("isFirstTimeUser", false);
  }

  Future<void> removePreferences() async {
    await sharedPreferences.remove("isLoggedIn");
  }
}
