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
  ValueNotifier<bool> _isChecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
