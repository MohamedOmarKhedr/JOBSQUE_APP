import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:job_finder/core/screens.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/my_button.dart';
import '../apply_job_screen/apply_job_1.dart';
import '../apply_job_screen/apply_job_2.dart';
import '../apply_job_screen/apply_job_3.dart';

class AppliedJobStepsScreen extends StatefulWidget {
  final Map<String,dynamic> appliedJobData;
  const AppliedJobStepsScreen({super.key, required this.appliedJobData});

  @override
  State<AppliedJobStepsScreen> createState() => _AppliedJobStepsScreenState();
}

class _AppliedJobStepsScreenState extends State<AppliedJobStepsScreen> {
  late ApplyJobCubit applyJobCubit;
  late int step;
  @override
  void didChangeDependencies() {
    applyJobCubit = ApplyJobCubit.get(context);
    applyJobCubit.currentApplyJobIndex=widget.appliedJobData['step'];
    step = widget.appliedJobData['step'];
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (step == 0){
                if (applyJobCubit.currentApplyJobIndex == 0) {
                  Navigator.pop(context);
                } else {
                  applyJobCubit.changeApplyJobScreensIndex(
                      --applyJobCubit.currentApplyJobIndex);
                }
              } else if (step == 1){
                if (applyJobCubit.currentApplyJobIndex == 1) {
                  Navigator.pop(context);
                } else {
                  applyJobCubit.changeApplyJobScreensIndex(
                      --applyJobCubit.currentApplyJobIndex);
                }
              } else if (step == 2){
                  Navigator.pop(context);
              }
            },
            icon: SvgPicture.asset(
              'assets/images/home_layout/arrow-left.svg',
              height: 3.h,
              width: 8.w,
            )),
        title: Text(
          'Job Detail',
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: BlocBuilder<ApplyJobCubit, ApplyJobState>(
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 5.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.sp),
                        image: DecorationImage(
                          image: AssetImage(
                              widget.appliedJobData['logo']), // Replace with your image asset
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
                        widget.appliedJobData['jobName'],
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
                        widget.appliedJobData['address'],
                        style: TextStyle(
                            fontSize: 10.sp,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey[600]),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    SvgPicture.asset(applyJobCubit
                        .applyJobImagePath[applyJobCubit.currentApplyJobIndex]),
                    SizedBox(height: 2.h),
                    if (applyJobCubit.currentApplyJobIndex == 0)
                      ApplyJob1(
                        applyJobCubit: applyJobCubit,
                      )
                    else if (applyJobCubit.currentApplyJobIndex == 1)
                      ApplyJob2(
                        applyJobCubit: applyJobCubit,
                      )
                    else if (applyJobCubit.currentApplyJobIndex == 2)
                        ApplyJob3(
                          applyJobCubit: applyJobCubit,
                        ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              if (applyJobCubit.currentApplyJobIndex == 0)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: MyButton(
                        onPressed: () {
                          if (applyJobCubit.userName != '' &&
                              applyJobCubit.email != '' &&
                              applyJobCubit.mobile != '') {
                            applyJobCubit.changeApplyJobScreensIndex(
                                ++applyJobCubit.currentApplyJobIndex);
                          } else {
                            Fluttertoast.showToast(
                                msg: "You must enter All Data",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.sp);
                          }
                        },
                        text: 'Next'),
                  ),
                )
              else if (applyJobCubit.currentApplyJobIndex == 1)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: MyButton(
                        onPressed: () {
                          if (applyJobCubit.indexTypeJob != -1) {
                            applyJobCubit.changeApplyJobScreensIndex(
                                ++applyJobCubit.currentApplyJobIndex);
                          } else {
                            Fluttertoast.showToast(
                                msg: "You must select type job",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.sp);
                          }
                        },
                        text: 'Next'),
                  ),
                )
              else if (applyJobCubit.currentApplyJobIndex == 2)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: MyButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, homeLayoutScreen,(route) => false,);
                          },
                          text: 'Summit'),
                    ),
                  )
            ],
          );
        },
      ),
    );
  }
}
