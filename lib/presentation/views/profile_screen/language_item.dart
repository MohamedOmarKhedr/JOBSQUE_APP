import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class LanguageItem extends StatefulWidget {
  final int currentIndex;
  final int index;
  final Map language;
  const LanguageItem({super.key, required this.currentIndex, required this.index, required this.language});

  @override
  State<LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.sp),
      child: Row(
        children: [
          Image.asset(widget.language['imagePath']),
          SizedBox(width: 2.w,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              widget.language['languageName'],
              textAlign: TextAlign.start,
              style:
              TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          widget.currentIndex == widget.index
              ? SvgPicture.asset('assets/images/home_layout/CheckCircle2.svg')
              : SvgPicture.asset('assets/images/home_layout/CheckCircle.svg')
        ],
      ),
    );
  }
}
