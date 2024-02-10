import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPasswordInputField extends StatelessWidget {
  const CustomPasswordInputField({
    super.key,
    required ValueNotifier<bool> isHidden,
    required TextEditingController passwordController,
    required FocusNode passwordFocusNode,
    required this.isDark,
  })  : _isHidden = isHidden,
        _passwordController = passwordController,
        _passwordFocusNode = passwordFocusNode;

  final ValueNotifier<bool> _isHidden;
  final TextEditingController _passwordController;
  final FocusNode _passwordFocusNode;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isHidden,
      builder: (context, value, child) {
        return TextFormField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
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
    );
  }
}
