import 'package:flutter/material.dart';
import 'package:job_finder/core/screens.dart';
import 'package:job_finder/presentation/views/profile_screen/profile_general_item.dart';
import 'package:sizer/sizer.dart';

import '../../style/colors.dart';

class ProfileGeneralBuilder extends StatelessWidget {
  final List<Map<String, dynamic>> profileGeneralData;
  const ProfileGeneralBuilder({super.key, required this.profileGeneralData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
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
            },
              child: ProfileGeneralItem(
            profileGeneralItemData: profileGeneralData[index], index: index,
          ));
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: grey,
            height: 2.h,
            thickness: 1,
          );
        },
        itemCount: profileGeneralData.length);
  }
}
