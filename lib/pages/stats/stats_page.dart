import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_normal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
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
            title: "Stats",
            hasNavigation: false,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  return const Center(
                    child: Text("Data is available"),
                  );

                default:
                  return const Center(
                    child: Text("Default"),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
