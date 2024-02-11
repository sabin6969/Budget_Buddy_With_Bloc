import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/widgets/custom_expense_card.dart';
import 'package:flutter/material.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          PreferredSize(
            preferredSize: Size(double.infinity, size.height * 0.25),
            child: customAppBar(
              context: context,
              name: "Sabin Poudel",
              greetings: "Good afternoon",
              height: size.height * 0.25,
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 150.h,
            left: 15.w,
            right: 15.w,
            child: customExpenseCard(
              context: context,
              size: size,
              income: 200000,
              expense: 540000,
              totalTransactions: 123023234232,
            ),
          ),
          Positioned(
            top: 400.h,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              child: Column(
                children: [
                  Text(
                    "Transaction History",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
