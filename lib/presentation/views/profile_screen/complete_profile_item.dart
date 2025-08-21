import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';

class CompleteProfileItem extends StatefulWidget {
  final bool isDone;
  final String title;
  final String subTitle;
  final int index;
  const CompleteProfileItem(
      {super.key,
      required this.isDone,
      required this.title,
      required this.subTitle,
      required this.index});

  @override
  State<CompleteProfileItem> createState() => _CompleteProfileItemState();
}

class _CompleteProfileItemState extends State<CompleteProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      height: 12.h,
      decoration: BoxDecoration(
        color: widget.isDone ? const Color(0xffE0EBFF) : Colors.white,
        border: Border.all(
          color: const Color(0xffE5E7EB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: Row(
        children: [
          Visibility(
              visible: widget.isDone,
              replacement:
                  SvgPicture.asset('assets/images/home_layout/tick-circle.svg'),
              child: SvgPicture.asset(
                  'assets/images/home_layout/tick-circle2.svg')),
          SizedBox(width: 2.w,),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
              ),
              Text(
                widget.subTitle,
                style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.grey[700],
                    overflow: TextOverflow.visible),
              ),
            ],
          )),
          IconButton(
              onPressed: () {
                if(widget.index==0) {
                  Navigator.pushNamed(context, editProfileScreen,arguments: 'Personal Details');
                } else if(widget.index==1) {
                  Navigator.pushNamed(context, educationScreen);
                } else if(widget.index==2) {
                  Navigator.pushNamed(context, experienceScreen);
                } else if(widget.index==3) {
                  Navigator.pushNamed(context, portfolioScreen);
                }
              },
              icon: SvgPicture.asset(
                  'assets/images/home_layout/arrow-right2.svg'))
        ],
      ),
    );
  }
}
