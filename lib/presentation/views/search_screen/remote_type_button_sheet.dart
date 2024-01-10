import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/my_button.dart';
import '../job_type_item.dart';

class RemoteTypeButtonSheet extends StatelessWidget {
  const RemoteTypeButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/home_layout/Vector 68.svg'),
          SizedBox(height: 2.h),
          Text('On-Side/Remote',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const JobTypeItem(text: 'Remote'),
              SizedBox(
                width: 1.w,
              ),
              const JobTypeItem(text: 'On-side'),
              SizedBox(
                width: 1.w,
              ),
              const JobTypeItem(text: 'Hybrid'),
              SizedBox(
                width: 1.w,
              ),
              const JobTypeItem(text: 'Any'),
            ],
          ),
          SizedBox(height: 5.h),
          MyButton(onPressed: () { Navigator.pop(context); }, text: 'Show Result',)

        ],

      ),
    );
  }
}
