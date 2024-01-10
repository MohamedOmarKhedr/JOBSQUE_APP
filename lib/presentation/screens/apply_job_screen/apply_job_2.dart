import 'package:flutter/material.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../views/job_type_for_apply_job_item.dart';

class ApplyJob2 extends StatefulWidget {
  final ApplyJobCubit applyJobCubit;
  const ApplyJob2({super.key, required this.applyJobCubit});

  @override
  State<ApplyJob2> createState() => _ApplyJob2State();
}

class _ApplyJob2State extends State<ApplyJob2> {


  List<String> jobsName = [
    'Senior UX Designer',
    'Senior UI Designer',
    'Graphic Designer',
    'Front-End Developer'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              'Type of work',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Fill in your bio data correctly',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 70.h,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 2.h,);
              },
              itemCount: jobsName.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    setState(() {
                      widget.applyJobCubit.indexTypeJob=index;
                      widget.applyJobCubit.workType=jobsName[index];
                    });
                  },
                    child: JobTypeForApplyJobItem(
                  jobsName: jobsName,
                  currentIndex: widget.applyJobCubit.indexTypeJob, index: index,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
