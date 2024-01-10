import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/core/screens.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';
import '../saved_screen/saved_icon.dart';

class AppliedItem extends StatelessWidget {
  final Map<String,dynamic> appliedJobData;
  const AppliedItem({super.key, required this.appliedJobData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, appliedJobStepsScreen,arguments:appliedJobData );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 5.h,
                width: 10.w,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(6.sp),
                  image: DecorationImage(
                    image: AssetImage(appliedJobData['logo']), // Replace with your image asset
                    fit: BoxFit.cover,
                  ),),

              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      appliedJobData['jobName']! ,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      appliedJobData['address']!,
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis),)
                  ],
                ),
              ),
              const SavedIcon(jobId: '-1',)
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 18.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xffD6E4FF),
                  borderRadius: BorderRadius.circular(25.sp),
                ),
                child: Center(
                  child: Text(
                    'Full Time' ,
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: blue),
                  ),
                ),
              ),
              SizedBox(width: 3.w,),
              Container(
                width: 18.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xffD6E4FF),
                  borderRadius: BorderRadius.circular(25.sp),
                ),
                child: Center(
                  child: Text(
                    'Remote',
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: blue),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Posted 2 days ago',
                style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: .5.h,horizontal: 1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(width: 1.sp,color: grey)
              ),
              child: SvgPicture.asset(appliedJobData['imageStep']))


        ],
      ),
    );
  }
}
