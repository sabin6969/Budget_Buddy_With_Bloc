import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_google_auth_button.dart';
import 'package:budgetbuddy_bloc/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
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
              CustomTextFormField(
                isDark: isDark,
                labelText: "Email",
                prefixIcon: CupertinoIcons.mail,
                textEditingController: _emailController,
                currentFocusNode: _emailFocusNode,
              ),
              SizedBox(
                height: 25.h,
              ),
              ValueListenableBuilder(
                valueListenable: _isHidden,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: value,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: isDark ? Colors.white : Colors.black,
                        size: 22.w,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _isHidden.value = !_isHidden.value;
                        },
                        icon: value
                            ? Icon(
                                Icons.visibility_outlined,
                                color: isDark ? Colors.white : Colors.black,
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomAuthButton(
                textColor: Colors.white,
                isPrimaryColor: true,
                buttonName: "Login",
                onPressed: () {},
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
                onPressed: () {},
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
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
    );
  }
}
