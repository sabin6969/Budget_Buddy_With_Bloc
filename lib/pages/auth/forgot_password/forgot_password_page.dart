import 'package:budgetbuddy_bloc/constants/title_text.dart';
import 'package:budgetbuddy_bloc/pages/auth/forgot_password/bloc/forgotpassword_bloc.dart';
import 'package:budgetbuddy_bloc/pages/auth/forgot_password/forgot_password_sent_page.dart';
import 'package:budgetbuddy_bloc/utils/ui_utils.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final ForgotpasswordBloc forgotpasswordBloc =
        BlocProvider.of<ForgotpasswordBloc>(context);
    return BlocListener<ForgotpasswordBloc, ForgotpasswordState>(
      listener: (context, state) {
        if (state is ForgotpasswordLoading) {
          UiUtils.showLoadingDialog(
              context: context, message: "Sending reset link");
        } else if (state is ForgotpasswordEmailSentSucess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ResetPasswordSentPage(),
            ),
            (route) => false,
          );
        } else if (state is FogetPasswordEmailSentFailed) {
          UiUtils.showSnackBar(message: state.message, context: context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Reset Password"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TitleText.emailResetMessage,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                isDark: isDark,
                labelText: "Email",
                prefixIcon: CupertinoIcons.mail,
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                currentFocusNode: _emailFocusNode,
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomAuthButton(
                textColor: Colors.white,
                isPrimaryColor: true,
                buttonName: "Send reset email",
                onPressed: () {
                  forgotpasswordBloc.add(
                    ForgotPasswordButtonPressed(email: _emailController.text),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
