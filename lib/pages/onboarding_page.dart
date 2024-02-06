import 'package:budgetbuddy_bloc/main.dart';
import 'package:flutter/material.dart';

class OnboadingPage extends StatefulWidget {
  const OnboadingPage({super.key});

  @override
  State<OnboadingPage> createState() => _OnboadingPageState();
}

class _OnboadingPageState extends State<OnboadingPage> {
  // @override
  // void initState() {
  //   userPreferences.markUserAsNotFirstTime();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Onboarding Screen"),
      ),
    );
  }
}
