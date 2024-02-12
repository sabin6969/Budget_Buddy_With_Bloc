import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customAppBarNormal({
  required BuildContext context,
  required Size size,
  required String title,
  bool hasNavigation = true,
}) {
  return Container(
    height: size.height * 0.25,
    width: size.width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.purple.shade400,
          Colors.deepPurple.shade400,
        ],
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.sp),
        bottomRight: Radius.circular(30.sp),
      ),
    ),
    child: hasNavigation
        ? Column(
            children: [
              SizedBox(
                height: 45.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                    ),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 30.sp,
                    ),
                  )
                ],
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
              )
            ],
          ),
  );
}
