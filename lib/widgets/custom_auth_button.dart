import 'package:budgetbuddy_bloc/main.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final Color textColor;
  final bool isPrimaryColor;
  final String buttonName;
  const CustomAuthButton({
    super.key,
    required this.textColor,
    required this.isPrimaryColor,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return MaterialButton(
      shape: const StadiumBorder(),
      height: size.height * 0.08,
      minWidth: size.width,
      onPressed: () {},
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
