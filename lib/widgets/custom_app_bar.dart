import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customAppBar({
  required BuildContext context,
  required String name,
  required String greetings,
  required double height,
  required void Function()? onPressed,
}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple.shade400,
            Colors.deepPurple.shade400,
          ]),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          30.sp,
        ),
        bottomRight: Radius.circular(
          30.sp,
        ),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greetings,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade300,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
