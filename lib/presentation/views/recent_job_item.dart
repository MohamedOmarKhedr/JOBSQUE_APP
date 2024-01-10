import 'package:flutter/material.dart';
import 'package:job_finder/presentation/views/saved_screen/saved_icon.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/home_cubit/home_cubit.dart';
import '../../core/screens.dart';
import '../../data/remote_data/responses/get_jobs_response.dart';
import '../style/colors.dart';

class RecentJobItem extends StatefulWidget {
  final JobData jobData;

  const RecentJobItem({super.key, required this.jobData, });

  @override
  State<RecentJobItem> createState() => _RecentJobItemState();
}

class _RecentJobItemState extends State<RecentJobItem> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, jobDetailsScreen,arguments: widget.jobData);
      },
      child: Padding(
        padding:  EdgeInsets.only(bottom: 1.5.h),
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
                  height: 6.h,
                  width: 12.w,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.sp),
                    image: DecorationImage(
                      image: NetworkImage(widget.jobData.image!), // Replace with your image asset
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
                        widget.jobData.name! ?? '',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        '${widget.jobData.compName} - ${widget.jobData.location}',
                        style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),)
                    ],
                  ),
                ),

                SavedIcon(jobId: widget.jobData.id.toString(),)
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      widget.jobData.jobTimeType! ?? '',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: blue),
                    ),
                  ),
                ),
                const Spacer(),
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
                Container(
                  width: 18.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffD6E4FF),
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Center(
                    child: Text(
                      widget.jobData.jobType! ?? '',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: blue),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.jobData.salary!.substring(0, widget.jobData.salary!.length - 3)}K',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff2E8E18)),
                    ),
                    Text(
                      '/Month',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
