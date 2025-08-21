import 'package:flutter/material.dart';
import 'package:job_finder/presentation/views/profile_screen/profile_other_item.dart';
import 'package:sizer/sizer.dart';

import '../../../core/screens.dart';
import '../../style/colors.dart';

class ProfileOtherBuilder extends StatelessWidget {
  final List<String> profileOtherTitle;
  const ProfileOtherBuilder({super.key, required this.profileOtherTitle});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              if(index==1){
                Navigator.pushNamed(context, helpCenterScreen);
              } else if(index==2){
                Navigator.pushNamed(context, termsAndConditionsScreen);
              } else if(index==3){
                Navigator.pushNamed(context, privacyPolicyScreen);
              } else if(index==4){
                Navigator.pushNamed(context, completeProfileScreen);
              }
            },
              child: ProfileOtherItem(
            profileOtherItemTitle: profileOtherTitle[index], index: index,
          ));
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: grey,
            height: 2.h,
            thickness: 1,
          );
        },
        itemCount: profileOtherTitle.length);
  }
}
