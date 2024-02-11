import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customExpenseCard({
  required BuildContext context,
  required Size size,
  required double totalTransactions,
  required double income,
  required double expense,
}) {
  return Card(
    elevation: 20,
    shadowColor: Colors.purple,
    shape: const StadiumBorder(),
    child: Container(
      height: size.height * 0.25,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.w,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple.shade500,
            Colors.deepPurple.shade500,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Transactions",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              totalTransactions.toString(),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Income",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.greenAccent,
                          ),
                    ),
                    Text(
                      income.toString(),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expense",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.red.shade100,
                          ),
                    ),
                    Text(
                      expense.toString(),
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
