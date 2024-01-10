import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class PopularSearches extends StatelessWidget {
  final String popularSearch;
  const PopularSearches({super.key, required this.popularSearch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: Row(
        children: [
          SvgPicture.asset('assets/images/home_layout/search-status.svg'),
          SizedBox(width:2.w),
          Expanded(child:Text(popularSearch,style: TextStyle(
            fontSize: 12.sp,
          ),)),
          IconButton(onPressed: (){
          },
              icon: SvgPicture.asset('assets/images/home_layout/arrow-right.svg'))
        ],
      ),
    );;
  }
}
