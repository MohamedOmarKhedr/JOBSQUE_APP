import 'package:flutter/material.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/presentation/views/saved_screen/saved_icon.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/home_cubit/home_cubit.dart';
import '../../data/remote_data/responses/get_jobs_response.dart';
import '../style/colors.dart';

class FilterJobItem extends StatefulWidget {
  final JobData filterJobData;

  const FilterJobItem({super.key, required this.filterJobData,});

  @override
  State<FilterJobItem> createState() => _FilterJobItemState();
}

class _FilterJobItemState extends State<FilterJobItem> {




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, jobDetailsScreen,arguments: widget.filterJobData);
      },
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
                height: 5.h,
                width: 10.w,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(6.sp),
                  image: DecorationImage(
                    image: NetworkImage(widget.filterJobData.image!), // Replace with your image asset
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
                      widget.filterJobData.name! ,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      '${widget.filterJobData.compName} - ${widget.filterJobData.location}',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis),)
                  ],
                ),
              ),

              SavedIcon(jobId: widget.filterJobData.id.toString(),)
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
                    widget.filterJobData.jobTimeType! ,
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: blue),
                  ),
                ),
              ),
              SizedBox(width: 3.w,),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${widget.filterJobData.salary!.substring(0, widget.filterJobData.salary!.length - 3)}K',
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
    );
  }
}
