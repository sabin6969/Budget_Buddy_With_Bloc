import 'package:budgetbuddy_bloc/constants/image_path.dart';
import 'package:budgetbuddy_bloc/constants/title_text.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/onboarding_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboadingPage extends StatefulWidget {
  const OnboadingPage({super.key});

  @override
  State<OnboadingPage> createState() => _OnboadingPageState();
}

class _OnboadingPageState extends State<OnboadingPage> {
  @override
  void initState() {
    userPreferences.markUserAsNotFirstTime();
    super.initState();
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  OnboadingContainer(
                    primaryText: TitleText.firstOnboardingPrimaryText,
                    secondaryText: TitleText.firstOnboadingSecondaryText,
                    imagePath: AppImagePath.firstOnboardingImage,
                  ),
                  OnboadingContainer(
                    primaryText: TitleText.secondOnboardingPrimaryText,
                    secondaryText: TitleText.secondOnboardingSecondaryText,
                    imagePath: AppImagePath.secondOnboardingImage,
                  ),
                  OnboadingContainer(
                    primaryText: TitleText.thirdOnboardingPrimaryText,
                    secondaryText: TitleText.thirdOnboardingSeconaryText,
                    imagePath: AppImagePath.thirdOnboardingImage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        shape: const BeveledRectangleBorder(),
        enableDrag: false,
        onClosing: () {},
        builder: (context) {
          return Container(
            color: Colors.white,
            height: size.height * 0.27,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                SmoothPageIndicator(
                  onDotClicked: (index) => _pageController.jumpToPage(
                    index,
                  ),
                  controller: _pageController,
                  count: 3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15.h,
                    horizontal: 10.w,
                  ),
                  child: Column(
                    children: [
                      const CustomAuthButton(
                        textColor: Colors.white,
                        isPrimaryColor: true,
                        buttonName: "Sign Up",
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const CustomAuthButton(
                        textColor: Colors.black,
                        isPrimaryColor: false,
                        buttonName: "Login",
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
