import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/pages/dashboard/dashboard_page.dart';
import 'package:budgetbuddy_bloc/pages/profile/bloc/profile_bloc.dart';
import 'package:budgetbuddy_bloc/pages/profile/profile_page.dart';
import 'package:budgetbuddy_bloc/pages/stats/stats_page.dart';
import 'package:budgetbuddy_bloc/pages/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const DashboardPage(),
          const StatsPage(),
          const WalletPage(),
          BlocProvider.value(
            value: BlocProvider.of<ProfileBloc>(context),
            child: const ProfilePage(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.addExpenseIncomePage,
          );
        },
        child: Icon(
          Icons.add,
          size: 20.sp,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => pageController.jumpToPage(index),
        type: BottomNavigationBarType.fixed,
        iconSize: 20.sp,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Bootstrap.house,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Bootstrap.graph_up_arrow,
            ),
            label: "Stats",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Bootstrap.wallet,
            ),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Bootstrap.person,
            ),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
