import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/home_cubit/home_cubit.dart';
import '../../style/colors.dart';
import '../saved_screen/saved_icon.dart';

class SearchItem extends StatefulWidget {
  final Map<String,String> jobData;
  const SearchItem({super.key, required this.jobData,});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
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
                    image: AssetImage(widget.jobData['logo']!), // Replace with your image asset
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
                      widget.jobData['jobName']! ,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      widget.jobData['address']!,
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis),)
                  ],
                ),
              ),

              const SavedIcon(jobId: '-1',)
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
                    'Full Time' ,
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
                    '\$${widget.jobData['salary']!}K',
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
