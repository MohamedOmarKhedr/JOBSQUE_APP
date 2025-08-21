import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';

class LoginAndSecurityItem extends StatelessWidget {
  final String title;
  final String content;
  final int index;
  const LoginAndSecurityItem({super.key, required this.title, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        const Spacer(),
        Text(
          content,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey[600],
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () {
            if(index==0){
              Navigator.pushNamed(context, emailAddressScreen);
            } else if(index==1){
              Navigator.pushNamed(context, phoneNumberScreen);
            } else if(index==2){
              Navigator.pushNamed(context, changePasswordScreen);
            } else if(index==3){
              Navigator.pushNamed(context, twoStepVerificationScreen);
            }
          },
          icon: SvgPicture.asset('assets/images/home_layout/arrow-right2.svg'),
        ),

      ],
    );
  }
}
