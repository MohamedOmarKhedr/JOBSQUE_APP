import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class ChatMoreSheetButton extends StatelessWidget {
  const ChatMoreSheetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      height: 80.h,
      child: ListView(
        children: [
          SvgPicture.asset('assets/images/home_layout/Vector 68.svg'),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/Visit job post.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/View my application.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/Mark as unread.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/Mute.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/Archived2.svg')),
          SizedBox(height: 2.h),
          InkWell(onTap:(){},child: SvgPicture.asset('assets/images/home_layout/Delete conversation.svg')),
          SizedBox(height: 2.h),




        ],

      ),
    );
  }
}
