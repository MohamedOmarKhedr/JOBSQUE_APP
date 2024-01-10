import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';

class ProfileGeneralItem extends StatelessWidget {
  final Map<String,dynamic> profileGeneralItemData;
  final int index;
  const ProfileGeneralItem({super.key, required this.profileGeneralItemData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(profileGeneralItemData['imagePath']),
        SizedBox(width: 4.w,),
        Expanded(child: Text(profileGeneralItemData['title'])),
        IconButton(onPressed: (){
          if(index==0) {
            Navigator.pushNamed(context, editProfileScreen,arguments: 'Edit Profile');
          }else if(index==1) {
            Navigator.pushNamed(context, portfolioScreen);
          }else if(index==2) {
            Navigator.pushNamed(context, languageScreen);
          }else if(index==3) {
            Navigator.pushNamed(context, notificationSettingScreen);
          }else if(index==4) {
            Navigator.pushNamed(context, loginAndSecurityScreen);
          }
        }, icon: SvgPicture.asset('assets/images/home_layout/arrow-right2.svg'))
      ],
    );
  }
}
