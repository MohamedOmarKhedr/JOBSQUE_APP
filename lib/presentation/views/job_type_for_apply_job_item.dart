import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/business_logic/apply_job_cubit/apply_job_cubit.dart';
import 'package:job_finder/presentation/style/colors.dart';
import 'package:sizer/sizer.dart';

class JobTypeForApplyJobItem extends StatefulWidget {
  final int currentIndex;
  final int index;
  final List<String> jobsName;
  const JobTypeForApplyJobItem(
      {super.key,
      required this.jobsName,
      required this.currentIndex,
      required this.index});

  @override
  State<JobTypeForApplyJobItem> createState() => _JobTypeForApplyJobItemState();
}

class _JobTypeForApplyJobItemState extends State<JobTypeForApplyJobItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: widget.currentIndex == widget.index
            ? const Color(0xffD6E4FF)
            : Colors.white,
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(
            color: widget.currentIndex == widget.index ? blue : grey),
      ),
      child: Padding(
        padding: EdgeInsets.all(3.sp),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    widget.jobsName[widget.index],
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Text(
                  'CV.pdf - Portfolio.pdf',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
                ),
              ],
            ),
            const Spacer(),
            widget.currentIndex == widget.index
                ? SvgPicture.asset('assets/images/home_layout/CheckCircle2.svg')
                : SvgPicture.asset('assets/images/home_layout/CheckCircle.svg')
          ],
        ),
      ),
    );
  }
}
