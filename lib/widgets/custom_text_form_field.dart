import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.isDark,
    required this.labelText,
    required this.prefixIcon,
    required this.textEditingController,
    required this.currentFocusNode,
    this.nextFocusNode,
  });

  final TextEditingController textEditingController;
  final bool isDark;
  final String labelText;
  final IconData prefixIcon;
  final FocusNode currentFocusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
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
        ),
      ),
    );
  }
}