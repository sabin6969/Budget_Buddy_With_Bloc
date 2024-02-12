import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/models/transactions_model.dart';
import 'package:budgetbuddy_bloc/pages/add_transaction/bloc/addtransaction_bloc.dart';
import 'package:budgetbuddy_bloc/utils/ui_utils.dart';
import 'package:budgetbuddy_bloc/widgets/custom_app_bar_normal.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_date_picker_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class AddExpenseIncomePage extends StatefulWidget {
  const AddExpenseIncomePage({super.key});

  @override
  State<AddExpenseIncomePage> createState() => _AddExpenseIncomePageState();
}

class _AddExpenseIncomePageState extends State<AddExpenseIncomePage> {
  final TextEditingController _transactionTitleController =
      TextEditingController();
  final FocusNode _transcationFocusNode = FocusNode();
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _amountFocusNode = FocusNode();
  final ValueNotifier<bool> isExpense = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    size = MediaQuery.sizeOf(context);
    final AddtransactionBloc addtransactionBloc =
        BlocProvider.of<AddtransactionBloc>(context);
    return Scaffold(
      body: BlocListener<AddtransactionBloc, AddtransactionState>(
        bloc: addtransactionBloc,
        listener: (context, state) {
          if (state is AddtransactionLoading) {
            UiUtils.showLoadingDialog(
                context: context, message: "Adding transcations");
          } else if (state is AddtransactionFailed) {
            Navigator.of(context).pop(); // Close loading dialog
            UiUtils.showSnackBar(message: state.message, context: context);
          } else if (state is AddtransactionSucess) {
            Navigator.of(context).pop(); // Close loading dialog
            UiUtils.showSnackBar(
              message: "Transcation added",
              context: context,
            );
            _transactionTitleController.clear();
            _amountController.clear();
          }
        },
        child: Stack(
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
                height: size.height * 0.7,
                width: size.width,
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.black.withOpacity(0.3)
                      : Colors.white.withOpacity(
                          0.2,
                        ),
                  borderRadius: BorderRadius.circular(
                    20.sp,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
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
                          textEditingController: _transactionTitleController,
                          textInputType: TextInputType.text,
                          currentFocusNode: _transcationFocusNode,
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
                        Row(
                          children: [
                            Expanded(
                              child: ValueListenableBuilder(
                                valueListenable: isExpense,
                                builder: (context, value, child) {
                                  return RadioListTile<bool>(
                                    value: true,
                                    groupValue: value,
                                    onChanged: (newValue) {
                                      isExpense.value = newValue!;
                                    },
                                    title: Text(
                                      "Expense",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: ValueListenableBuilder(
                                valueListenable: isExpense,
                                builder: (context, value, child) {
                                  return RadioListTile<bool>(
                                    value: false,
                                    groupValue: value,
                                    onChanged: (newValue) {
                                      isExpense.value = newValue!;
                                    },
                                    title: Text(
                                      "Income",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomAuthButton(
                          textColor: Colors.white,
                          isPrimaryColor: true,
                          buttonName: "Add Expense",
                          onPressed: () {
                            addtransactionBloc.add(
                              AddTransactionEvent(
                                transactionModel: TransactionModel(
                                  timeStamp: timeStamp,
                                  id: DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                  title: _transactionTitleController.text,
                                  amount: num.tryParse(_amountController.text),
                                  isExpense: isExpense.value,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
