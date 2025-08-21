import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class HelpCenterItem extends StatefulWidget {
  const HelpCenterItem({super.key});

  @override
  State<HelpCenterItem> createState() => _HelpCenterItemState();
}

class _HelpCenterItemState extends State<HelpCenterItem> {
  bool isDetails = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          border: Border.all(color: grey, width: 1),
          borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Lorem ipsum dolor sit amet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              const Spacer(),
              Visibility(
                visible: isDetails,
                replacement: IconButton(
                  onPressed: () {setState(() {
                    isDetails=true;
                  });},
                  icon: SvgPicture.asset(
                      'assets/images/home_layout/arrow-up.svg'),
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isDetails=false;
                    });
                  },
                  icon: SvgPicture.asset(
                      'assets/images/home_layout/arrow-down2.svg'),
                ),
              ),
            ],
          ),
          if(isDetails)
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.',
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey[600],
              overflow: TextOverflow.visible
            ),)
        ],
      ),
    );
  }
}
