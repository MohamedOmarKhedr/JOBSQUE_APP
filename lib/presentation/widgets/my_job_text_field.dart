import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class MyJobTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const MyJobTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    required this.onChanged,
    required this.controller,
    this.keyboardType = TextInputType.text, TextInputType textInputType=TextInputType.text, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: grey),
            borderRadius: BorderRadius.circular(8.sp)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: grey),
            borderRadius: BorderRadius.circular(8.sp)),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      ),
    );
  }
}
