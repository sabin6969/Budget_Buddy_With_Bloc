import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/models/transactions_model.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_for_home_page.dart';
import 'package:budgetbuddy_bloc/widgets/custom_expense_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<TransactionModel> transctions = [];

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
            child: customAppBarForHomePage(
              context: context,
              name: "Sabin Poudel",
              greetings: "Good afternoon",
              height: size.height * 0.25,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.notificationPageRoute,
                );
              },
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
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              child: SizedBox(
                height: size.height,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Transaction History",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    Flexible(
                      child: StreamBuilder(
                        stream: FirebaseHelper().getAllTransactions(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.active:
                            case ConnectionState.done:
                              if (snapshot.data!.docs.isEmpty) {
                                return const Center(
                                  child: Text("No transactions to show"),
                                );
                              } else {
                                transctions = snapshot.data!.docs.map((e) {
                                  return TransactionModel.fromJson(e.data());
                                }).toList();
                                return SizedBox(
                                  height: size.height * 0.4,
                                  child: ListView.builder(
                                    itemCount: transctions.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 15.h,
                                        ),
                                        child: Material(
                                          color: transctions[index].isExpense!
                                              ? Colors.red
                                              : Colors.green,
                                          child: ListTile(
                                            onTap: () {},
                                            title: Text(
                                              transctions[index].title ?? "",
                                            ),
                                            tileColor:
                                                transctions[index].isExpense!
                                                    ? Colors.red
                                                    : Colors.green,
                                            subtitle: Text(
                                              "Rs ${transctions[index].amount}",
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                            default:
                              return const SizedBox();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
