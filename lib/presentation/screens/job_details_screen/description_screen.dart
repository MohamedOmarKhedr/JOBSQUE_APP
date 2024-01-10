import 'package:flutter/material.dart';
import 'package:job_finder/data/remote_data/responses/get_jobs_response.dart';
import 'package:sizer/sizer.dart';

class DescriptionScreen extends StatelessWidget {
  final JobData jobData;
  const DescriptionScreen({super.key, required this.jobData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.h),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Job Description',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            jobData.jobDescription!,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 10.sp,color: Colors.grey[600]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Skill Required',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            jobData.jobSkill!,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 10.sp,color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
