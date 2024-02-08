import 'package:budgetbuddy_bloc/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboadingContainer extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final String imagePath;
  const OnboadingContainer({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.4,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: size.height * 0.4,
              width: size.width,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              primaryText,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 28.w,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              secondaryText,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
