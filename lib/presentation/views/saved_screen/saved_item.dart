import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/data/remote_data/responses/get_jobs_response.dart';
import 'package:job_finder/presentation/views/saved_screen/saved_more_sheet_button.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';
import '../../style/colors.dart';

class SavedItem extends StatefulWidget {
  final JobData jobData;
  const SavedItem({super.key, required this.jobData});

  @override
  State<SavedItem> createState() => _SavedItemState();
}

class _SavedItemState extends State<SavedItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, jobDetailsScreen,
                arguments: widget.jobData);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 5.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.sp),
                        image: DecorationImage(
                          image: NetworkImage(widget
                              .jobData.image!), // Replace with your image asset
                          fit: BoxFit.cover,
                        ),
                      ),
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
                            widget.jobData.name!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            "${widget.jobData.compName!} - ${widget.jobData.location}",
                            style: TextStyle(
                                fontSize: 8.sp,
                                color: Colors.grey[600],
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SavedMoreSheetButton(
                                  jobData: widget.jobData);
                            },
                          );
                        },
                        icon: SvgPicture.asset(
                            'assets/images/home_layout/more.svg'))
                  ],
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Posted 2 days ago',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis),
                    ),
                    const Spacer(),
                    Text(
                      'Be an early applicant',
                      style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 2.h,
          color: grey,
          thickness: .5.sp,
        )
      ],
    );
  }
}
