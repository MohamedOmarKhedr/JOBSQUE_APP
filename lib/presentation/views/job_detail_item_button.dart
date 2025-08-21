import 'package:flutter/material.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:sizer/sizer.dart';

import '../style/colors.dart';

class JobDetailItemButton extends StatefulWidget {
  final ApplyJobCubit applyJobCubit;
  final int thisIndex;
  const JobDetailItemButton({super.key, required this.applyJobCubit, required this.thisIndex, });

  @override
  State<JobDetailItemButton> createState() => _JobDetailItemButtonState();
}

class _JobDetailItemButtonState extends State<JobDetailItemButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.applyJobCubit.changeJobDetailScreensIndex(widget.thisIndex);
      },
      child: Container(
        height: 7.h,
        width: 30.w,
        decoration: BoxDecoration(
            color: widget.applyJobCubit.currentJobDetailIndex == widget.thisIndex
                ? const Color(0xff02337A)
                : grey,
            borderRadius: BorderRadius.circular(25.sp)),
        child: Center(
            child: Text(
              widget.applyJobCubit.jobDetailTitles[widget.thisIndex],
              style: TextStyle(
                  fontSize: 12.sp,
                  color: widget.applyJobCubit.currentJobDetailIndex == widget.thisIndex
                      ? Colors.white
                      : Colors.black),
            )),
      ),
    );
  }
}
