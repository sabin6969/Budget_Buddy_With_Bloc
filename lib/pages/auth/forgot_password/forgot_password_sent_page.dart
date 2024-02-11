import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/constants/image_path.dart';
import 'package:budgetbuddy_bloc/constants/title_text.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordSentPage extends StatefulWidget {
  const ResetPasswordSentPage({super.key});

  @override
  State<ResetPasswordSentPage> createState() => _ResetPasswordSentPageState();
}

class _ResetPasswordSentPageState extends State<ResetPasswordSentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AppImagePath.resetEmailImage,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              TitleText.emailIsOnTheWay,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              TitleText.resetEmailInstructions,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomAuthButton(
              textColor: Colors.white,
              isPrimaryColor: true,
              buttonName: "Back to login",
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.loginPageRoute,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
