import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class CountryItemButton extends StatelessWidget {
  final Map<String,dynamic> countries;
  final void Function() onTap;
  const CountryItemButton({super.key, required this.countries, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
            minWidth: 10.w
        ),
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.sp),
        height: 6.h,
        decoration: BoxDecoration(
            color: countries['isClicked']? const Color(0xffD6E4FF):const Color(0xffFAFAFA),
            border: Border.all(width: 1.sp,color:countries['isClicked']? blue:Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(25.sp))
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(countries['imagePath'],),
            SizedBox(width: 2.w,),
            Text(
              countries['text'],
              style:
              TextStyle(fontSize: 10.sp, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
