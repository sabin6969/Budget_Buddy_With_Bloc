import 'package:budgetbuddy_bloc/widgets/custom_auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final ValueNotifier<bool> _isChecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
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
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                controller: _nameController,
                focusNode: _nameFocusNode,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                focusNode: _emailFocusNode,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Enter your email",
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: isDark ? Colors.white : Colors.black,
                    size: 22.w,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: isDark ? Colors.white : Colors.black,
                    size: 22.w,
                  ),
                ),
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
                height: 20.h,
              ),
              CustomAuthButton(
                textColor: Colors.white,
                isPrimaryColor: false,
                buttonName: "Continue with Google  ",
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
                    onPressed: () {},
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
