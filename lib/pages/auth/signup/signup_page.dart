import 'package:budgetbuddy_bloc/constants/app_routes.dart';
import 'package:budgetbuddy_bloc/main.dart';
import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_google_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_password_input_field.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final FocusNode _nameFocusNode = FocusNode();

  final ValueNotifier<bool> _isChecked = ValueNotifier(true);

  final ValueNotifier<bool> _isHidden = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                textInputType: TextInputType.name,
                textEditingController: _nameController,
                currentFocusNode: _nameFocusNode,
                nextFocusNode: _emailFocusNode,
                isDark: isDark,
                labelText: "Enter your name",
                prefixIcon: Icons.person_outline,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                textInputType: TextInputType.emailAddress,
                isDark: isDark,
                labelText: "Enter your email",
                prefixIcon: CupertinoIcons.mail,
                textEditingController: _emailController,
                currentFocusNode: _emailFocusNode,
                nextFocusNode: _passwordFocusNode,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomPasswordInputField(
                isHidden: _isHidden,
                passwordController: _passwordController,
                passwordFocusNode: _passwordFocusNode,
                isDark: isDark,
              ),
              SizedBox(
                height: 20.h,
              ),
              Transform.scale(
                scale: 1,
                child: ValueListenableBuilder(
                  valueListenable: _isChecked,
                  builder: (context, value, child) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: value,
                      onChanged: (newValue) {
                        _isChecked.value = newValue!;
                      },
                      title: Text(
                        "By signing up, you agree to the Terms of Service and Privacy Policy",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomAuthButton(
                textColor: Colors.white,
                isPrimaryColor: true,
                buttonName: "Sign Up",
                onPressed: () {},
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Or with",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomGoogleAuthButton(
                buttonName: "Continue with Google",
                onPressed: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.loginPageRoute,
                      );
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
