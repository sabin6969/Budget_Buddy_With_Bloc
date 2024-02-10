import 'package:budgetbuddy_bloc/main.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final Color textColor;
  final bool isPrimaryColor;
  final String buttonName;
  final void Function()? onPressed;
  const CustomAuthButton(
      {super.key,
      required this.textColor,
      required this.isPrimaryColor,
      required this.buttonName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return MaterialButton(
      shape: const StadiumBorder(),
      height: size.height * 0.07,
      minWidth: size.width,
      onPressed: onPressed,
      color: isPrimaryColor
          ? Theme.of(context).primaryColor
          : Theme.of(context).secondaryHeaderColor,
      child: Text(
        buttonName,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}
