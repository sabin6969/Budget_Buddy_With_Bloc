import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

String formattedDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day + 7,
          ),
        ).then((value) {
          formattedDate = DateFormat("yyyy-MM-dd").format(
            value!,
          );
          timeStamp = value.millisecondsSinceEpoch.toString();
          setState(() {});
        });
      },
      child: Ink(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedDate,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Icon(
                Bootstrap.calendar_fill,
                size: 22.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
