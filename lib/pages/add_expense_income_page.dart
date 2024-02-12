import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_normal.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_date_picker_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class AddExpenseIncomePage extends StatefulWidget {
  const AddExpenseIncomePage({super.key});

  @override
  State<AddExpenseIncomePage> createState() => _AddExpenseIncomePageState();
}

class _AddExpenseIncomePageState extends State<AddExpenseIncomePage> {
  final TextEditingController _expenseTitleController = TextEditingController();
  final FocusNode _expenseFocusNode = FocusNode();
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _amountFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
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
            child: customAppBarNormal(
              context: context,
              size: size,
              title: "Add expense or income",
            ),
          ),
          Positioned(
            top: 130.h,
            left: 25.w,
            right: 25.w,
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.white.withOpacity(
                        0.5,
                      ),
                borderRadius: BorderRadius.circular(
                  20.sp,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextFormField(
                        isDark: isDark,
                        labelText: "Expense title",
                        prefixIcon: EvaIcons.text,
                        textEditingController: _expenseTitleController,
                        textInputType: TextInputType.text,
                        currentFocusNode: _expenseFocusNode,
                        nextFocusNode: _amountFocusNode,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        isDark: isDark,
                        labelText: "Amount",
                        prefixIcon: Bootstrap.currency_dollar,
                        textEditingController: _amountController,
                        textInputType: TextInputType.number,
                        currentFocusNode: _amountFocusNode,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomDatePicker(),
                      SizedBox(height: 30.h),
                      CustomAuthButton(
                        textColor: Colors.white,
                        isPrimaryColor: true,
                        buttonName: "Add Expense",
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
