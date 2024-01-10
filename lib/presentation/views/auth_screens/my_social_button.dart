import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

class MySocialButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final void Function() onTap;
  const MySocialButton({super.key, required this.imagePath, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 40.w,
      decoration: BoxDecoration(
        border: Border.all(width: .5.sp,color: grey),
        borderRadius: BorderRadius.all(Radius.circular(6.sp))
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath,),
            SizedBox(width: 1.5.w,),
            Text(
              text,
              style:
              TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
