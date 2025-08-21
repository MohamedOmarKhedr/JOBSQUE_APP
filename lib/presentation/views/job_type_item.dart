import 'package:flutter/material.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

class JobTypeItem extends StatefulWidget {
  final String text;
  const JobTypeItem({super.key, required this.text});

  @override
  State<JobTypeItem> createState() => _JobTypeItemState();
}

class _JobTypeItemState extends State<JobTypeItem> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (isClicked) {
            isClicked = false;
          } else {
            isClicked = true;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.sp),
          border: Border.all(
            color: isClicked ? blue : Colors.grey,
          ),
          color: isClicked ? const Color(0xffD6E4FF) : Colors.white,
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: isClicked ? blue : Colors.grey),
          ),
        ),
      ),
    );
  }
}
