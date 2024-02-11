import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiUtils {
  static showLoadingDialog(
      {required BuildContext context, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const BeveledRectangleBorder(),
          content: Row(
            children: [
              const CircularProgressIndicator(),
              SizedBox(
                width: 20.w,
              ),
              Text(
                message,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              )
            ],
          ),
        );
      },
    );
    return;
  }

  static showSnackBar(
      {required String message, required BuildContext context}) {
    SnackBar snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }
}
