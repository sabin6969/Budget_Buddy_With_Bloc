import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.isDark,
    this.labelText,
    required this.prefixIcon,
    this.textEditingController,
    required this.textInputType,
    required this.currentFocusNode,
    this.nextFocusNode,
    this.textCapitalization,
    this.initialValue,
  });

  final TextEditingController? textEditingController;
  final bool isDark;
  final String? labelText;
  final IconData prefixIcon;
  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;
  final TextInputType textInputType;
  final TextCapitalization? textCapitalization;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: textInputType,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.normal,
          ),
      controller: textEditingController,
      focusNode: currentFocusNode,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: isDark ? Colors.white : Colors.black,
          size: 22.w,
        ),
      ),
    );
  }
}
