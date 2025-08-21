import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class JobItemButton extends StatelessWidget {
  final Map<String,dynamic> jobs;
  final void Function() onTap;
  const JobItemButton({super.key, required this.jobs, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 15.h
        ),
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h),
        width: 42.w,
          decoration: BoxDecoration(
            color: jobs['isClicked']? const Color(0xffD6E4FF):const Color(0xffFAFAFA),
              border: Border.all(width: 1 .sp,color:jobs['isClicked']? blue:Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(6.sp))
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(jobs['imagePath'],),
            SizedBox(height: 2.h,),
            Text(
              jobs['text'],
              style:
              TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
