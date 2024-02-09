import 'package:budgetbuddy_bloc/constants/image_path.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGoogleAuthButton extends StatelessWidget {
  final String buttonName;
  final void Function() onPressed;
  const CustomGoogleAuthButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return MaterialButton(
      height: size.height * 0.07,
      color: const Color(0xFFE0E0E0),
      minWidth: size.width,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImagePath.googleLogo,
            height: 35.h,
            width: 35.w,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            buttonName,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.black,
                ),
          )
        ],
      ),
    );
  }
}
