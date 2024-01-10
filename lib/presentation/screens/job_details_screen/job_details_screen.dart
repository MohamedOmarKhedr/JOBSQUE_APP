import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/business_logic/home_cubit/home_cubit.dart';
import 'package:job_finder/presentation/screens/job_details_screen/people_screen.dart';
import 'package:job_finder/presentation/widgets/my_button.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/apply_job_cubit/apply_job_cubit.dart';
import '../../../core/screens.dart';
import '../../../data/remote_data/responses/get_jobs_response.dart';
import '../../style/colors.dart';
import '../../views/back_arrow_button.dart';
import '../../views/job_detail_item_button.dart';
import '../../views/saved_screen/saved_icon.dart';
import 'company_screen.dart';
import 'description_screen.dart';

class JobDetailsScreen extends StatefulWidget {

  final JobData jobData;

  const JobDetailsScreen({
    super.key,
    required this.jobData,
  });

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  
  late ApplyJobCubit applyJobCubit;

  @override
  void didChangeDependencies() {
    applyJobCubit = ApplyJobCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowButton(context: context),
        title: Text(
          'Job Detail',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        actions:  [SavedIcon(jobId: widget.jobData.id.toString(),)],
      ),
      body: BlocBuilder<ApplyJobCubit, ApplyJobState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.sp),
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.jobData.image!), // Replace with your image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      widget.jobData.name!,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      '${widget.jobData.compName} - ${widget.jobData.location}',
                      style: TextStyle(
                          fontSize: 10.sp,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 23.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffD6E4FF),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        child: Center(
                          child: Text(
                            widget.jobData.jobTimeType!,
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Container(
                        width: 23.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffD6E4FF),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        child: Center(
                          child: Text(
                            'Remote',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Container(
                        width: 23.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffD6E4FF),
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                        child: Center(
                          child: Text(
                            widget.jobData.jobType! ,
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    height: 7.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: grey, borderRadius: BorderRadius.circular(25.sp)),
                    child: Row(
                      children: [
                        JobDetailItemButton(
                            applyJobCubit: applyJobCubit, thisIndex: 0),
                        JobDetailItemButton(
                            applyJobCubit: applyJobCubit, thisIndex: 1),
                        JobDetailItemButton(
                            applyJobCubit: applyJobCubit, thisIndex: 2),
                      ],
                    ),
                  ),
                  if (applyJobCubit.currentJobDetailIndex == 0)
                    Expanded(child: DescriptionScreen(jobData: widget.jobData))
                  else if (applyJobCubit.currentJobDetailIndex == 1)
                    Expanded(child: CompanyScreen(jobData: widget.jobData))
                  else if (applyJobCubit.currentJobDetailIndex == 2)
                    Expanded(child: PeopleScreen(jobData: widget.jobData))
                ],
              ),
              Align(alignment: Alignment.bottomCenter,
              child:MyButton(onPressed: () {
                Navigator.pushNamed(context, applyJobScreen,arguments: widget.jobData);
              }, text: 'Apply Now',) ,)
            ],
          );
        },
      ),
    );
  },
);
  }
}
