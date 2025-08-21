import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/home_cubit/home_cubit.dart';
import 'package:job_finder/presentation/views/saved_screen/saved_icon.dart';
import 'package:sizer/sizer.dart';

import '../../core/screens.dart';
import '../../data/remote_data/responses/get_jobs_response.dart';

class SuggestedJobItem extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color textColor;
  final JobData jobData;

  const SuggestedJobItem(
      {super.key,
      required this.color1,
      required this.color2,
      required this.jobData,
      required this.textColor,});

  @override
  State<SuggestedJobItem> createState() => _SuggestedJobItemState();
}

class _SuggestedJobItemState extends State<SuggestedJobItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, jobDetailsScreen,arguments: widget.jobData);
      },
      child: Container(
        height: 25.h,
        width: 80.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),

        decoration: BoxDecoration(
          color: widget.color1,
          borderRadius: BorderRadius.circular(10.sp),
        ),
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
                  padding: EdgeInsets.all(2.sp),
                  decoration:
                      BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(10.sp)),
                  child: Container(
                    height: 4.h,
                    width: 8.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10.sp),
                        image: DecorationImage(
                          image: NetworkImage(widget.jobData.image!), // Replace with your image asset
                          fit: BoxFit.cover,
                        ),),

                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: Text(
                    widget.jobData.name! ?? '',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: widget.textColor,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SavedIcon(jobId: widget.jobData.id.toString(), )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 23.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: widget.color2,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Center(
                    child: Text(
                      widget.jobData.jobTimeType! ?? '',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: widget.textColor),
                    ),
                  ),
                ),
                Container(
                  width: 23.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: widget.color2,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Center(
                    child: Text(
                      'Remote',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: widget.textColor),
                    ),
                  ),
                ),
                Container(
                  width: 23.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: widget.color2,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Center(
                    child: Text(
                      widget.jobData.jobType! ?? '',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: widget.textColor),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.jobData.salary!.substring(0, widget.jobData.salary!.length - 3)}K',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: widget.textColor),
                    ),
                    Text(
                      '/Month',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: widget.textColor),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 6.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: const Color(0xff3366FF),
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, applyJobScreen,arguments: widget.jobData);
                    },
                    child: Center(
                      child: Text(
                        'Apply Now',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: widget.textColor),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
