import 'package:budgetbuddy_bloc/helpers/firebase_helper.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/models/transactions_model.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_normal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  List<TransactionModel> transactions = [];
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
            title: "Statistics",
            hasNavigation: false,
          ),
          Positioned(
            top: 250.h,
            child: StreamBuilder(
              stream: _firebaseHelper.getAllTransactions(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    transactions = snapshot.data!.docs.map((e) {
                      return TransactionModel.fromJson(e.data());
                    }).toList();

                    if (transactions.isEmpty) {
                      return SizedBox(
                        height: size.height * 0.4,
                        width: size.width,
                        child: Center(
                          child: Text(
                            "No transactions to visualize",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      height: size.height * 0.4,
                      width: size.width,
                      child: LineChart(
                        LineChartData(
                          lineBarsData: getLineBarsData(transactions),
                        ),
                      ),
                    );

                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  List<LineChartBarData> getLineBarsData(List<TransactionModel> transactions) {
    List<FlSpot> spots = [];

    DateTime firstDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(transactions[0].timeStamp!));
    for (int i = 0; i < transactions.length; i++) {
      DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(
          int.parse(transactions[i].timeStamp!));
      double xValue = currentDate.difference(firstDate).inDays.toDouble();
      spots.add(
        FlSpot(
          xValue,
          transactions[i].amount!.toDouble(),
        ),
      );
    }

    return [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        color: Colors.blue,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.blue.withOpacity(0.3),
        ),
      ),
    ];
  }
}
