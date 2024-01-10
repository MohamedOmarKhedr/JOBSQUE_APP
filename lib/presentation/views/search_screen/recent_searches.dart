import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class RecentSearches extends StatefulWidget {
  final String recentSearch;
  const RecentSearches({super.key, required this.recentSearch});

  @override
  State<RecentSearches> createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  bool isClicked=false;

  @override
  Widget build(BuildContext context) {
    return isClicked? const Center():
    SizedBox(
      height: 5.h,
      child: Row(
        children: [
          SvgPicture.asset('assets/images/home_layout/clock.svg'),
          SizedBox(width:2.w),
          Expanded(child:Text(widget.recentSearch,style: TextStyle(
            fontSize: 12.sp,
          ),)),
          IconButton(onPressed: (){
            setState(() {
              isClicked=true;
            });
          },
              icon: SvgPicture.asset('assets/images/home_layout/close-circle.svg'))
        ],
      ),
    );
  }
}
