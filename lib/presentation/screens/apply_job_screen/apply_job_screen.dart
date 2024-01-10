import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:job_finder/data/remote_data/responses/get_jobs_response.dart';
import 'package:job_finder/presentation/screens/apply_job_screen/apply_job_3.dart';
import 'package:job_finder/presentation/widgets/my_button.dart';
import 'package:sizer/sizer.dart';
import 'apply_job_1.dart';
import 'apply_job_2.dart';

class ApplyJobScreen extends StatefulWidget {
  final JobData jobData;

  const ApplyJobScreen({
    super.key,
    required this.jobData,
  });

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  late ApplyJobCubit applyJobCubit;

  @override
  void didChangeDependencies() {
    applyJobCubit = ApplyJobCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (applyJobCubit.currentApplyJobIndex == 0) {
                Navigator.pop(context);
              } else {
                applyJobCubit.changeApplyJobScreensIndex(
                    --applyJobCubit.currentApplyJobIndex);
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
      body: BlocListener<ApplyJobCubit, ApplyJobState>(
        listener: (context, state) {
          if (state is ApplyJobSuccessState) {
            applyJobCubit.afterApplyJob(
                compName: widget.jobData.compName!,
                imagePath: widget.jobData.image!,
                context: context);
          }
        },
        child: BlocBuilder<ApplyJobCubit, ApplyJobState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset(applyJobCubit
                          .applyJobImagePath[applyJobCubit.currentApplyJobIndex]),
                      SizedBox(
                        height: 2.h,
                      ),
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
                      SizedBox(height: 8.h,)
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
                            applyJobCubit
                                .onApplyJobButton(widget.jobData.id!.toInt());
                          },
                          text: 'Summit'),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
