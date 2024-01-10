import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../data/remote_data/responses/get_jobs_response.dart';
import '../../style/colors.dart';

class CompanyScreen extends StatelessWidget {
  final JobData jobData;
  const CompanyScreen({super.key,required this.jobData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.h),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Contact Us',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(
                height: 8.h,
                width: 40.w,
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  border: Border.all(color: grey)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 10.sp,color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    Text(
                      jobData.compName!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 8.sp, fontWeight: FontWeight.bold,overflow: TextOverflow.visible),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 8.h,
                width: 40.w,
                padding: EdgeInsets.all(5.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.sp),
                    border: Border.all(color: grey)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WebSide',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 10.sp,color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    Text(
                      jobData.compWebsite!,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 8.sp, fontWeight: FontWeight.bold,overflow: TextOverflow.visible),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'About Company',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            jobData.aboutComp!,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 10.sp,color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
