import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class MessageTextField extends StatelessWidget {
  final String hintText;
  const MessageTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: grey,width: .5.sp),
            borderRadius: BorderRadius.circular(25.sp)),
        border: OutlineInputBorder(
            borderSide:  BorderSide(color: grey,width: .5.sp),
            borderRadius: BorderRadius.circular(25.sp)),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
            color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      ),
    );
  }
}
