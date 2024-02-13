import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/models/transactions_model.dart';
import 'package:budgetbuddy_bloc/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:budgetbuddy_bloc/utils/greeting_message.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_for_home_page.dart';
import 'package:budgetbuddy_bloc/widgets/custom_expense_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<TransactionModel> transctions = [];

  @override
  void initState() {
    if (context.read<DashboardBloc>().state is DashboardInitial) {
      context.read<DashboardBloc>().add(LoadDashboardDataEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    final DashboardBloc dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    return Scaffold(
        body: BlocBuilder(
      bloc: dashboardBloc,
      builder: (context, state) {
        if (state is DashboardLoadedState) {
          return Stack(
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
                  name: state.userData.userName ?? "User",
                  greetings: getGreetingMessage(),
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
                  income: 0,
                  expense: 0,
                  totalTransactions: 0,
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
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
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
                                    return SizedBox(
                                      height: size.height * 0.35,
                                      width: size.width,
                                      child: Center(
                                        child: Text(
                                          "No transactions to show",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14.sp,
                                              ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    transctions = snapshot.data!.docs.map((e) {
                                      return TransactionModel.fromJson(
                                          e.data());
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
                                              color:
                                                  transctions[index].isExpense!
                                                      ? Colors.red
                                                      : Colors.green,
                                              child: ListTile(
                                                onTap: () {},
                                                title: Text(
                                                  transctions[index].title ??
                                                      "",
                                                ),
                                                tileColor: transctions[index]
                                                        .isExpense!
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
          );
        } else if (state is DashboardErrorState) {
          return Center(
            child: Text(
              state.message,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          );
        } else if (state is DashboardLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    ));
  }
}
