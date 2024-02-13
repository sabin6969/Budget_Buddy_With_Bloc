import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_normal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          customAppBarNormal(
            context: context,
            size: size,
            title: "Wallet",
            hasNavigation: false,
          ),
          Positioned(
            top: 250.h,
            left: 100.w,
            right: 100.w,
            child: SizedBox(
              height: size.height * 0.5,
              width: size.width,
              child: Center(
                child: Text(
                  "Comming Soon",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
