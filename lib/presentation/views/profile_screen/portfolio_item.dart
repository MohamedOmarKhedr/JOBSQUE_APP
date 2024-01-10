import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/business_logic/profile_cubit/profile_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/my_cache_keys.dart';
import '../../../data/local_data/my_cache.dart';
import '../../style/colors.dart';

class PortfolioItem extends StatefulWidget {
  final int index;
  final String fileName;
  final String fileSize;
  final ProfileCubit profileCubit;
  const PortfolioItem({super.key, required this.index, required this.fileName, required this.fileSize, required this.profileCubit});

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
          border: Border.all(color: grey),
          borderRadius: BorderRadius.circular(10.sp)),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/home_layout/pdf.svg'),
          SizedBox(width: 2.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text(
                    widget.fileName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 10.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'CV.pdf - ${widget.fileSize} bytes',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 8.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                widget.profileCubit.editPortfolio(widget.index);
              },
              icon: SvgPicture.asset(
                  'assets/images/home_layout/edit-2.svg')),
          IconButton(
              onPressed: () {
                widget.profileCubit.removePortfolio(widget.index);
              },
              icon: SvgPicture.asset(
                  'assets/images/home_layout/close-circle.svg')),
        ],
      ),
    );
  }
}
