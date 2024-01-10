import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyTitle extends StatelessWidget {
  final String text;
  const MyTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 2.h),
      color: const Color(0xffF4F4F5),
      padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
      ),
    );
  }
}
