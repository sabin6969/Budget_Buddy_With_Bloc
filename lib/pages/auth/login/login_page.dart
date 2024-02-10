import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/pages/auth/login/bloc/login_bloc.dart';
import 'package:budgetbuddy_bloc/utils/ui_utils.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_google_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_password_input_field.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _isHidden = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    final bool isDark =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          UiUtils.showLoadingDialog(context: context, message: "Loading");
        } else if (state is LoginInitial) {
          Navigator.pop(context);
        } else if (state is LoginFailed) {
          UiUtils.showSnackBar(message: state.message, context: context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 15.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.emailAddress,
                  isDark: isDark,
                  labelText: "Email",
                  prefixIcon: CupertinoIcons.mail,
                  textEditingController: _emailController,
                  currentFocusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode,
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomPasswordInputField(
                  isHidden: _isHidden,
                  passwordController: _passwordController,
                  passwordFocusNode: _passwordFocusNode,
                  isDark: isDark,
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomAuthButton(
                  textColor: Colors.white,
                  isPrimaryColor: true,
                  buttonName: "Login",
                  onPressed: () {
                    loginBloc.add(
                      LoginButtonPressed(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Or with",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomGoogleAuthButton(
                  buttonName: "Login with Google",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.resetPasswordPageRoute,
                    );
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.signUpPageRoute,
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 13.sp,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
